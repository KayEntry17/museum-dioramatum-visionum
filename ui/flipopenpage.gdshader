shader_type canvas_item;
uniform float croonit:hint_range(0.0, 1.2, 0.01);
//void vertex() {
	////croonit+=TIME*10.0
	//if (VERTEX.x<=0.5){
		//if (VERTEX.y<=0.5){
		//VERTEX.y-=200.0*sin((croonit)/289.0);}
		//
		//else{
			//VERTEX.y+=200.0*sin((croonit)/289.0);
		//
		//}
		//VERTEX.x+=3.0*(croonit);}
//}
void fragment() {
	vec2 truv=UV;
	float croonitx=pow(croonit,6)*700.0;
	//truv.x-=pow((-UV.x+1.0),2)*croonitx;
	if (croonit>1.0){
		croonitx=pow(croonit+(croonit-1.0)*5.0,6)*700.0;}
		//croonit+=(croonit-1.0)*1000
	truv.x-=pow((UV.x),2)*croonitx;
	truv.y-=pow(croonit,2)*1.0*(UV.y-0.5)*(1.0-truv.x);
	//float croonitx=pow(croonit,6)*700.0;
	//truv.x-=pow((-UV.x+1.04),2)*croonitx;
	COLOR=texture(TEXTURE,truv);
	//COLOR=vec4(truv,1.0,1.0);
	if (truv.x<0.0){
		COLOR.a=0.0;}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
