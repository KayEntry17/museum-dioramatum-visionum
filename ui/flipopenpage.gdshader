shader_type canvas_item;
uniform float croonit;
void vertex() {
	//croonit+=TIME*10.0
	if (VERTEX.x<=0.5){
		if (VERTEX.y<=0.5){
		VERTEX.y-=200.0*sin((croonit)/289.0);}
		
		else{
			VERTEX.y+=200.0*sin((croonit)/289.0);
		
		}
		VERTEX.x+=3.0*(croonit);}
}
//void fragment() {
	//COLOR=vec4(UV,vec2(1));
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
