precision highp float;

attribute vec3 position;
attribute vec2 uv;
attribute vec3 normal;

uniform mat4 worldViewProjection;
uniform mat4 world;
uniform mat4 view;

uniform mat4 lightMatrix;

varying vec3 vWorldPos;
varying vec3 vNormalW;
varying vec4 vPositionFromLight;
varying vec2 vUV;

void main(void) {
    vec4 worldPos = world * vec4(position, 1.0);
    vWorldPos = worldPos.xyz;
    vUV = uv;
    
    vNormalW = normalize(vec3(world * vec4(normal, 0.0)));
    
    vPositionFromLight = lightMatrix * worldPos;

    gl_Position = worldViewProjection * vec4(position, 1.0);
}