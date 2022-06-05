//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 shade_color; //hue to apply over the sprite

void main() {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * shade_color;
}
