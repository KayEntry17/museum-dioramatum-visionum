shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear;
uniform vec4 col: source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR=texture(SCREEN_TEXTURE,SCREEN_UV);
	if (texture(SCREEN_TEXTURE,SCREEN_UV).rgb==vec3(1.0)){
		COLOR=col;}else{COLOR=vec4(1.0);}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
