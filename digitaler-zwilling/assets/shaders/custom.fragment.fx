precision highp float;

varying vec2 vUV;
varying vec3 vPositionW;
varying vec3 vNormalW;

uniform sampler2D textureSampler;
uniform sampler2D heightMap;
uniform float time;
uniform vec2 resolution;

const float heightScale = 0.1;
const int numLayers = 32;

vec2 parallaxMapping(vec2 texCoords, vec3 viewDir) {
    float layerDepth = 1.0 / float(numLayers);
    float currentLayerDepth = 0.0;
    vec2 deltaTexCoords = viewDir.xy * heightScale / float(numLayers);
    vec2 currentTexCoords = texCoords;

    for (int i = 0; i < numLayers; i++) {
        currentTexCoords -= deltaTexCoords;
        currentLayerDepth += layerDepth;
        float currentDepthMapValue = texture2D(heightMap, currentTexCoords).r;
        if (currentLayerDepth > currentDepthMapValue) {
            return currentTexCoords;
        }
    }
    return texCoords;
}

void main(void) {
    vec3 viewDir = normalize(vPositionW - vec3(0.0, 0.0, 0.0));
    vec2 texCoords = parallaxMapping(vUV, viewDir);
    vec4 color = texture2D(textureSampler, texCoords);
    gl_FragColor = color;
}