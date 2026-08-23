precision highp float;

// Varying
varying vec2 vUV;
varying vec3 vPositionW;
varying vec3 vNormalW;

// Uniforms
uniform vec3 baseColor;
uniform float windowDensity;
uniform float windowSize;
uniform vec3 windowColor;
uniform vec3 lightColor;
uniform float ambientIntensity;
uniform float time;
uniform float isLargeBuilding; // 0 for family houses, 1 for large buildings
uniform float buildingStyle;   // Additional parameter to differentiate building styles

// Improved random function for better distribution
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Improved noise for more natural variation
float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));
    
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

// Hash function for more varied window patterns
float hash(float n) {
    return fract(sin(n) * 43758.5453);
}

void main(void) {
    // Base building color with subtle variation for more realistic surfaces
    float colorNoise = noise(vUV * 20.0) * 0.1;
    vec3 buildingColor = baseColor * (0.9 + colorNoise);
    
    // Apply realistic lighting based on normal direction
    float lighting = max(0.65, 0.6 + 0.4 * dot(vNormalW, normalize(vec3(1.0, 3.0, 2.0))));
    vec3 litBuildingColor = buildingColor * lighting;
    
    // Final color starts with building color
    vec3 finalColor = litBuildingColor;
    
    // Calculate building proportions from UV
    float aspect = vUV.x > 0.75 || vUV.x < 0.25 ? 0.5 : 1.0; // Side faces vs front/back
    
    // Calculate building dimensions based on face orientation and position
    float faceWidthScale = aspect;
    float faceHeightScale = 1.0;
    
    // Architectural parameters based on building size and style
    float bottomMargin, topMargin;
    float horizontalWindowCount;
    int buildingClass;
    
    // Determine building type based on isLargeBuilding flag and buildingStyle parameters
    if (isLargeBuilding > 0.5) {
        // Large building categories
        buildingClass = int(buildingStyle * 3.0); // 0-2 range
        
        // Margins vary by building class
        bottomMargin = 0.1 + hash(float(buildingClass)) * 0.05; // 10-15%
        topMargin = 0.05 + hash(float(buildingClass) + 1.0) * 0.05; // 5-10%
        
        // Window count based on building style and density
        horizontalWindowCount = 3.0 + floor(windowDensity * 0.7) + float(buildingClass);
    } else {
        // Small/residential building
        buildingClass = 3 + int(buildingStyle * 2.0); // 3-4 range
        
        // Margins for residential buildings
        bottomMargin = 0.15; // 15%
        topMargin = 0.25 + hash(vUV.x) * 0.1; // 25-35% (for peaked roofs)
        
        // Fewer windows on small buildings
        horizontalWindowCount = 1.0 + floor(windowDensity * 0.3);
    }
    
    // Early exit if in margin areas (foundation or roof)
    if (vUV.y < bottomMargin || vUV.y > (1.0 - topMargin)) {
        gl_FragColor = vec4(litBuildingColor, 1.0);
        return;
    }
    
    // Calculate available facade height for windows
    float availableHeight = 1.0 - bottomMargin - topMargin;
    
    // ARCHITECTURAL STYLES BASED ON BUILDING CLASS
    
    // CLASS 0: Modern high-rise with regular grid pattern (Yellow circle - tall buildings)
    if (buildingClass == 0) {
        // Calculate stories (4-6 depending on building height)
        float storiesCount = 4.0 + hash(vUV.x * vUV.y) * 2.0;
        
        // Calculate normalized position within facade
        float normalizedY = (vUV.y - bottomMargin) / availableHeight;
        float storyIndex = floor(normalizedY * storiesCount);
        float storyPos = fract(normalizedY * storiesCount);
        
        // Window distribution parameters
        float windowHeightRatio = 0.6; // Windows take 60% of story height
        float windowVerticalMargin = (1.0 - windowHeightRatio) * 0.5;
        
        // Skip areas between windows vertically
        if (storyPos < windowVerticalMargin || storyPos > (1.0 - windowVerticalMargin)) {
            // Add subtle floor divider lines
            if (abs(storyPos - windowVerticalMargin) < 0.02 || 
                abs(storyPos - (1.0 - windowVerticalMargin)) < 0.02) {
                finalColor = buildingColor * 0.9 * lighting;
            }
            
            gl_FragColor = vec4(finalColor, 1.0);
            return;
        }
        
        // Horizontal window placement
        float cellPos = fract(vUV.x * horizontalWindowCount);
        float windowWidth = 0.7; // Width relative to cell
        float windowHorizontalMargin = (1.0 - windowWidth) * 0.5;
        
        // Skip areas between windows horizontally
        if (cellPos < windowHorizontalMargin || cellPos > (1.0 - windowHorizontalMargin)) {
            gl_FragColor = vec4(finalColor, 1.0);
            return;
        }
        
        // Window frames
        float frameSize = 0.05;
        bool isFrame = 
            (cellPos > windowHorizontalMargin && cellPos < (windowHorizontalMargin + frameSize)) || 
            (cellPos > (1.0 - windowHorizontalMargin - frameSize) && cellPos < (1.0 - windowHorizontalMargin)) ||
            (storyPos > windowVerticalMargin && storyPos < (windowVerticalMargin + frameSize)) || 
            (storyPos > (1.0 - windowVerticalMargin - frameSize) && storyPos < (1.0 - windowVerticalMargin));
        
        // Window randomization - different pattern per floor
        vec2 gridPos = vec2(floor(vUV.x * horizontalWindowCount), storyIndex);
        float rnd = random(gridPos);
        
        // Window lighting effect
        float timeEffect = sin(time * 0.3 + rnd * 6.28) * 0.5 + 0.5;
        bool isLit = timeEffect > 0.6 && rnd > 0.4;
        
        // Determine final color
        if (isFrame) {
            finalColor = buildingColor * 1.2 * lighting;
        } else if (isLit) {
            finalColor = windowColor * lighting;
        } else {
            finalColor = buildingColor * 0.4 * lighting;
        }
    }
    
    // CLASS 1: Office building with horizontal bands (Red circle - spread-out buildings)
    else if (buildingClass == 1) {
        // Calculate bands (3-4 horizontal bands, evenly distributed)
        float bandCount = 3.0 + step(0.5, hash(vUV.x)); // 3-4 bands
        
        // Calculate band height and spacing
        float bandHeight = availableHeight / (bandCount * 3.0); // Band height (1/3 of available space per band)
        float bandSpacing = (availableHeight - (bandCount * bandHeight)) / (bandCount - 1.0); // Spacing between bands
        
        // Check if we're in any window band
        bool inWindowBand = false;
        float bandPos = 0.0;
        int currentBand = -1;
        
        for (int i = 0; i < 4; i++) { // Support up to 4 bands
            if (float(i) >= bandCount) break; // Skip if we have fewer bands
            
            // Calculate the start and end positions of this band
            float bandStart = bottomMargin + (float(i) * (bandHeight + bandSpacing));
            float bandEnd = bandStart + bandHeight;
            
            // Check if we're in this band
            if (vUV.y >= bandStart && vUV.y <= bandEnd) {
                inWindowBand = true;
                bandPos = (vUV.y - bandStart) / bandHeight; // Normalized position within band
                currentBand = i;
                break;
            }
        }
        
        // If not in any window band, return building color
        if (!inWindowBand) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Higher window density for this style
        float localWindowCount = horizontalWindowCount * 1.5;
        
        // Window placement
        float cellPos = fract(vUV.x * localWindowCount);
        float windowWidth = 0.8; // Width relative to cell
        float windowMargin = (1.0 - windowWidth) * 0.5;
        
        // Skip if not in window horizontal zone
        if (cellPos < windowMargin || cellPos > (1.0 - windowMargin)) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Window frames
        float frameSize = 0.04; // Thinner frames
        bool isFrame = 
            (cellPos > windowMargin && cellPos < (windowMargin + frameSize)) || 
            (cellPos > (1.0 - windowMargin - frameSize) && cellPos < (1.0 - windowMargin)) ||
            (bandPos < frameSize) || (bandPos > (1.0 - frameSize));
        
        // Add horizontal dividers within windows
        if (abs(bandPos - 0.5) < 0.01) {
            isFrame = true;
        }
        
        // Window randomization - different pattern per band
        vec2 gridPos = vec2(floor(vUV.x * localWindowCount), float(currentBand));
        float rnd = random(gridPos);
        
        // Window lighting effect
        float timeEffect = sin(time * 0.3 + rnd * 6.28) * 0.5 + 0.5;
        bool isLit = timeEffect > 0.65 && rnd > 0.45;
        
        // Determine final color
        if (isFrame) {
            finalColor = buildingColor * 1.1 * lighting;
        } else if (isLit) {
            finalColor = windowColor * lighting;
        } else {
            finalColor = buildingColor * 0.45 * lighting;
        }
    }
    
    // CLASS 2: Modern apartment building with irregular window pattern
    else if (buildingClass == 2) {
        // Calculate stories (5-7 stories)
        float storiesCount = 5.0 + floor(hash(vUV.x * 7.65) * 3.0);
        
        // Calculate normalized position within facade
        float normalizedY = (vUV.y - bottomMargin) / availableHeight;
        float storyIndex = floor(normalizedY * storiesCount);
        float storyPos = fract(normalizedY * storiesCount);
        
        // Create irregular window pattern
        float windowHeightVar = hash(storyIndex + vUV.x * 3.0) * 0.2 + 0.4; // 40-60% height
        float windowVerticalMargin = (1.0 - windowHeightVar) * 0.5;
        
        // Floor division marker
        if (storyPos < 0.05) {
            finalColor = buildingColor * 0.85 * lighting;
            gl_FragColor = vec4(finalColor, 1.0);
            return;
        }
        
        // Skip if not in window vertical zone
        if (storyPos < windowVerticalMargin || storyPos > (1.0 - windowVerticalMargin)) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Horizontal window placement - varying window widths
        float localWindowCount = horizontalWindowCount * (0.8 + hash(storyIndex * 8.44) * 0.4);
        float cellPos = fract(vUV.x * localWindowCount);
        float windowWidth = 0.5 + hash(storyIndex + floor(vUV.x * localWindowCount)) * 0.3; // 50-80% width
        float windowMargin = (1.0 - windowWidth) * 0.5;
        
        // Skip if not in window horizontal zone
        if (cellPos < windowMargin || cellPos > (1.0 - windowMargin)) {
            // Check for balconies on some floors
            if (hash(storyIndex * 3.33) > 0.6 && abs(storyPos - (1.0 - windowVerticalMargin)) < 0.05) {
                // Balcony railing
                float railingPattern = fract(vUV.x * localWindowCount * 5.0);
                if (railingPattern < 0.5) {
                    finalColor = buildingColor * 0.8 * lighting;
                } else {
                    finalColor = buildingColor * 1.1 * lighting;
                }
            }
            
            gl_FragColor = vec4(finalColor, 1.0);
            return;
        }
        
        // Window frames
        float frameSize = 0.04;
        bool isFrame = 
            (cellPos > windowMargin && cellPos < (windowMargin + frameSize)) || 
            (cellPos > (1.0 - windowMargin - frameSize) && cellPos < (1.0 - windowMargin)) ||
            (storyPos > windowVerticalMargin && storyPos < (windowVerticalMargin + frameSize)) || 
            (storyPos > (1.0 - windowVerticalMargin - frameSize) && storyPos < (1.0 - windowVerticalMargin));
        
        // Add window divisions (cross design)
        if (abs(cellPos - 0.5) < 0.02 || abs(storyPos - 0.5) < 0.015) {
            isFrame = true;
        }
        
        // Window randomization with floor-specific patterns
        vec2 gridPos = vec2(floor(vUV.x * localWindowCount), storyIndex);
        float rnd = random(gridPos);
        
        // Window lighting effect
        float timeEffect = sin(time * 0.3 + rnd * 6.28) * 0.5 + 0.5;
        bool isLit = timeEffect > 0.55 && rnd > 0.35;
        
        // Determine final color
        if (isFrame) {
            finalColor = buildingColor * 1.15 * lighting;
        } else if (isLit) {
            finalColor = windowColor * lighting;
        } else {
            finalColor = buildingColor * 0.35 * lighting;
        }
    }
    
    // CLASS 3: Residential house with limited windows
    else if (buildingClass == 3) {
        // Normalized UV for window placement
        vec2 normalizedUV = vec2(
            vUV.x,
            (vUV.y - bottomMargin) / availableHeight
        );
        
        // 1-2 rows of windows
        float verticalWindowCount = 1.0 + step(0.5, hash(vUV.x * 3.33));
        
        // Calculate grid positions
        vec2 gridPos = floor(normalizedUV * vec2(horizontalWindowCount, verticalWindowCount));
        vec2 cellPos = fract(normalizedUV * vec2(horizontalWindowCount, verticalWindowCount));
        
        // Window placement with clear margins
        float windowWidth = 0.65;     // Window width as percentage of cell
        float windowHeight = 0.7;    // Window height as percentage of cell
        
        // Determine if we're in a window region
        bool isInWindowRegion = 
            cellPos.x > (0.5 - windowWidth/2.0) && 
            cellPos.x < (0.5 + windowWidth/2.0) && 
            cellPos.y > (0.5 - windowHeight/2.0) && 
            cellPos.y < (0.5 + windowHeight/2.0);
        
        // Some houses have no windows on certain sides
        bool hasWindowsOnThisSide = hash(vUV.y * 7.89) > 0.2;
        
        if (!hasWindowsOnThisSide) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Window probability
        bool hasWindow = random(gridPos) < 0.98; // Most grid positions have windows
        
        // Check if window should be lit
        float timeEffect = sin(time * 0.3 + random(gridPos) * 6.28) * 0.5 + 0.5;
        bool isLit = timeEffect > 0.7 && random(gridPos) > 0.4;
        
        // Window frames
        float frameSize = 0.06; // Thicker frames for houses
        bool isFrame = 
            (isInWindowRegion && cellPos.x > (0.5 - windowWidth/2.0) && cellPos.x < (0.5 - windowWidth/2.0 + frameSize)) || 
            (isInWindowRegion && cellPos.x > (0.5 + windowWidth/2.0 - frameSize) && cellPos.x < (0.5 + windowWidth/2.0)) || 
            (isInWindowRegion && cellPos.y > (0.5 - windowHeight/2.0) && cellPos.y < (0.5 - windowHeight/2.0 + frameSize)) || 
            (isInWindowRegion && cellPos.y > (0.5 + windowHeight/2.0 - frameSize) && cellPos.y < (0.5 + windowHeight/2.0));
            
        // Add window divisions (cross design)
        if (isInWindowRegion && (abs(cellPos.x - 0.5) < 0.02 || abs(cellPos.y - 0.5) < 0.015)) {
            isFrame = true;
        }
        
        // Determine final color
        if (isInWindowRegion && hasWindow) {
            if (isFrame) {
                finalColor = buildingColor * 1.3 * lighting; // Brighter frames for houses
            } else if (isLit) {
                finalColor = windowColor * lighting;
            } else {
                finalColor = buildingColor * 0.3 * lighting; // Darker windows when not lit
            }
        }
    }
    
    // CLASS 4: Traditional building with arched windows
    else if (buildingClass == 4) {
        // Two rows of windows
        float verticalWindowCount = 2.0;
        
        // Calculate grid positions
        float normalizedY = (vUV.y - bottomMargin) / availableHeight;
        float windowRow = floor(normalizedY * verticalWindowCount);
        float rowPos = fract(normalizedY * verticalWindowCount);
        
        // Windows take up more space on traditional buildings
        float windowHeight = 0.75;  
        float windowVerticalMargin = (1.0 - windowHeight) * 0.5;
        
        // Skip if not in window vertical zone
        if (rowPos < windowVerticalMargin || rowPos > (1.0 - windowVerticalMargin)) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Calculate horizontal window position
        float cellPos = fract(vUV.x * horizontalWindowCount);
        float windowWidth = 0.7; 
        float windowMargin = (1.0 - windowWidth) * 0.5;
        
        // Skip if not in window horizontal zone
        if (cellPos < windowMargin || cellPos > (1.0 - windowMargin)) {
            gl_FragColor = vec4(litBuildingColor, 1.0);
            return;
        }
        
        // Normalized position within the window
        vec2 windowUV = vec2(
            (cellPos - windowMargin) / windowWidth,
            (rowPos - windowVerticalMargin) / windowHeight
        );
        
        // Arch shape at the top
        bool isArch = windowUV.y > 0.7 && windowRow == 1.0;
        if (isArch) {
            // Calculate distance from center of window
            float centerDist = abs(windowUV.x - 0.5) * 2.0;
            float archHeight = 1.0 - ((1.0 - windowUV.y) / 0.3); // 0-1 from bottom to top of arch area
            
            // Arch shape test
            if (centerDist > (1.0 - pow(archHeight, 0.7))) {
                gl_FragColor = vec4(litBuildingColor, 1.0);
                return;
            }
        }
        
        // Window frames
        float frameSize = 0.05;
        bool isFrame = 
            (windowUV.x < frameSize) || 
            (windowUV.x > (1.0 - frameSize)) ||
            (windowUV.y < frameSize) || 
            (windowUV.y > (1.0 - frameSize));
            
        // Window divisions - traditional windows often have multiple panes
        if ((abs(windowUV.x - 0.5) < 0.01) || 
            (abs(windowUV.y - 0.5) < 0.01 && windowRow < 1.0)) {
            isFrame = true;
        }
        
        // Window randomization
        vec2 gridPos = vec2(floor(vUV.x * horizontalWindowCount), windowRow);
        float rnd = random(gridPos);
        
        // Window lighting
        float timeEffect = sin(time * 0.3 + rnd * 6.28) * 0.5 + 0.5;
        bool isLit = timeEffect > 0.7 && rnd > 0.4;
        
        // Final window color
        if (isFrame) {
            finalColor = buildingColor * 1.2 * lighting;
        } else if (isLit) {
            finalColor = windowColor * lighting;
        } else {
            finalColor = buildingColor * 0.35 * lighting;
        }
    }
    
    gl_FragColor = vec4(finalColor, 1.0);
}