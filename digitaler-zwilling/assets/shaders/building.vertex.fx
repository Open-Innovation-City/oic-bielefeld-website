precision highp float;

// Attributes
attribute vec3 position;
attribute vec2 uv;
attribute vec3 normal;

// Uniforms
uniform mat4 worldViewProjection;
uniform mat4 world;

// Varying
varying vec2 vUV;
varying vec3 vPositionW;
varying vec3 vNormalW;

void main(void) {
    gl_Position = worldViewProjection * vec4(position, 1.0);
    
    vUV = uv;
    vPositionW = (world * vec4(position, 1.0)).xyz;
    vNormalW = normalize(vec3(world * vec4(normal, 0.0)));
}