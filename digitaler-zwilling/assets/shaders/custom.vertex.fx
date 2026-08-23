precision highp float;

attribute vec3 position;
attribute vec3 normal;
attribute vec2 uv;

uniform mat4 worldViewProjection;

varying vec2 vUV;
varying vec3 vPositionW;
varying vec3 vNormalW;

void main(void) {
    gl_Position = worldViewProjection * vec4(position, 1.0);
    vUV = uv;
    vPositionW = vec3(worldViewProjection * vec4(position, 1.0));
    vNormalW = normalize(vec3(worldViewProjection * vec4(normal, 0.0)));
}