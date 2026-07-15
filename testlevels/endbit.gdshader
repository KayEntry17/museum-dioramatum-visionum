shader_type spatial;

uniform float transparency=1;
render_mode blend_mix, depth_draw_opaque, unshaded;

void fragment() {
	ALBEDO=vec3(1.);
	ALPHA =pow(( pow(VIEW.y,2)+pow(VIEW.x,2)+pow(VIEW.z,2)),2)/3.;
	ALPHA=pow(dot(NORMAL,VIEW),3.)*transparency;
}