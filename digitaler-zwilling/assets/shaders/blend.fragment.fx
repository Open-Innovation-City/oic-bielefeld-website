precision highp float;

varying vec3 vWorldPos;
varying vec3 vNormalW;
varying vec4 vPositionFromLight;
varying vec2 vUV;

uniform sampler2D baseTexture;
uniform sampler2D overlayTexture;
uniform vec3 baseColor;
uniform vec3 roadColor;
uniform float uvFlipY;
uniform float uvFlipX;
uniform vec2 overlayWorldMin;
uniform vec2 overlayWorldSize;

// Shadow uniforms
uniform sampler2D shadowSampler;
uniform float shadowBias;
uniform vec3 lightDirection;
uniform vec3 lightColor;

// Poisson disc samples for soft shadows
vec2 poissonDisk[16];

void initPoissonSamples() {
    poissonDisk[0] = vec2(-0.94201624, -0.39906216);
    poissonDisk[1] = vec2(0.94558609, -0.76890725);
    poissonDisk[2] = vec2(-0.094184101, -0.92938870);
    poissonDisk[3] = vec2(0.34495938, 0.29387760);
    poissonDisk[4] = vec2(-0.91588581, 0.45771432);
    poissonDisk[5] = vec2(-0.81544232, -0.87912464);
    poissonDisk[6] = vec2(-0.38277543, 0.27676845);
    poissonDisk[7] = vec2(0.97484398, 0.75648379);
    poissonDisk[8] = vec2(0.44323325, -0.97511554);
    poissonDisk[9] = vec2(0.53742981, -0.47373420);
    poissonDisk[10] = vec2(-0.26496911, -0.41893023);
    poissonDisk[11] = vec2(0.79197514, 0.19090188);
    poissonDisk[12] = vec2(-0.24188840, 0.99706507);
    poissonDisk[13] = vec2(-0.81409955, 0.91437590);
    poissonDisk[14] = vec2(0.19984126, 0.78641367);
    poissonDisk[15] = vec2(0.14383161, -0.14100790);
}

float computeShadowPoisson(vec4 vPositionFromLight, float bias) {
    vec3 depth = vPositionFromLight.xyz / vPositionFromLight.w;
    depth = 0.5 * depth + vec3(0.5);
    
    vec2 uv = depth.xy;
    
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        return 1.0;
    }
    
    initPoissonSamples();
    
    float shadow = 0.0;
    float currentDepth = depth.z;
    float shadowMapSize = 4096.0; // shadow map resolution
    float filterRadius = 2.0; // softer/harder shadows
    
    for (int i = 0; i < 16; i++) {
        vec2 sampleUV = uv + poissonDisk[i] * filterRadius / shadowMapSize;
        float shadowDepth = texture2D(shadowSampler, sampleUV).r;
        
        if (currentDepth - bias > shadowDepth) {
            shadow += 1.0;
        }
    }
    
    shadow /= 16.0;
    
    return mix(1.0, 0.8, shadow);
}

void main(void) {
    vec2 sampledUV = vUV;
    if (uvFlipY > 0.5) {
        sampledUV.y = 1.0 - sampledUV.y;
    }

    vec4 baseTexSample = texture2D(baseTexture, sampledUV);
    
    bool isDummyTexture = length(baseTexSample.rgb - vec3(1.0)) < 0.01;
    
    vec4 base;
    if (isDummyTexture) {
        base = vec4(baseColor, 1.0);
    } else {
        if (length(baseColor - vec3(1.0)) > 0.1) {
            base = vec4(baseColor, 1.0);
        } else {
            base = baseTexSample;
        }
    }
    
    vec2 overlayUV = (vWorldPos.xz - overlayWorldMin) / overlayWorldSize;
    if (uvFlipX > 0.5) {
        overlayUV.x = 1.0 - overlayUV.x;
    }
    if (uvFlipY > 0.5) {
        overlayUV.y = 1.0 - overlayUV.y;
    }

    vec4 overlay = texture2D(overlayTexture, overlayUV);

    if (length(roadColor - vec3(1.0)) > 0.1) {
        overlay.rgb *= roadColor;
    }

    float upness = clamp(vNormalW.y, 0.0, 1.0);
    vec4 blendedColor = mix(base, overlay, overlay.a * upness);
    
    float shadow = computeShadowPoisson(vPositionFromLight, shadowBias);
    
    vec3 finalColor = blendedColor.rgb * shadow;
    
    gl_FragColor = vec4(finalColor, 1.0);
}