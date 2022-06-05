//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D mask; // texture of mask

void main()
{
	vec4 texture = texture2D( gm_BaseTexture, v_vTexcoord );
	float mask_alpha = texture2D(mask, v_vTexcoord).a;
    gl_FragColor = vec4(v_vColour.rgb * texture.rgb, v_vColour.a * texture.a * mask_alpha);
}
