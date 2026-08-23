precision highp float;

varying vec2 vUV;
uniform float time;
uniform vec2 resolution;

// Basic noise function for texture generation
float random(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(random(i + vec2(0.0, 0.0)), random(i + vec2(1.0, 0.0)), f.x),
               mix(random(i + vec2(0.0, 1.0)), random(i + vec2(1.0, 1.0)), f.x), f.y);
}

void main() {
    // Create a layered noise effect to simulate complex clouds
    vec2 p = vUV * 50.0 - vec2(time * 0.05, 0.0);

    // Layered noise for fluffiness, at different scales
    float baseCloud = noise(p) * 0.8;            // Base cloud structure
    float detailCloud = noise(p * 2.0) * 0.3;    // Smaller, detailed clouds
    float fluffCloud = noise(p * 4.0) * 0.1;     // Fine fluffiness

    // Combine layers and apply a power function for density
    float cloudDensity = pow(baseCloud + detailCloud + fluffCloud, 1.2);

    // Define a brighter, more opaque color for fluffy clouds
    vec3 cloudColor = vec3(1.0); // Pure white

    // Set minimum and maximum alpha values for fluffy clouds
    float minAlpha = 0.3; // Increase this to make clouds more solid
    float maxAlpha = .9; // Full opacity for the densest clouds

    // Cloud alpha based on density, with a sharper transition
    float cloudAlpha = smoothstep(0.5, 0.8, cloudDensity) * (maxAlpha - minAlpha) + minAlpha;

    // Apply a vertical fade to the bottom of the plane for smooth blending
    float verticalFade = smoothstep(0.3, 0.5, vUV.y); // Adjust to control fade height

    // Combine cloud alpha with vertical fade for final alpha
    float finalAlpha = cloudAlpha * verticalFade;

    // Set the final color with the calculated alpha
    gl_FragColor = vec4(cloudColor, finalAlpha);
}
