shader_type canvas_item;
uniform float croonit;
uniform float offset;
//void vertex() {
	////croonit+=TIME*10.0
	//if (VERTEX.x<=0.5){
		//if (VERTEX.y<=0.5){
		//VERTEX.y-=1000.0*sin((croonit));}
		//
		//else{
			//VERTEX.y+=1000.0*sin((croonit));
		//
		//}
		//VERTEX.x+=(croonit*220.0);}
//}
void fragment() {
	//vec2 truv=UV;
	float croonitx=pow(croonit,6)*700.0;
	croonitx=pow(croonit,4)*200.0;
	//truv.x-=pow((-UV.x+1.0),2)*chkhjkhjkhroonitx;
	//if (croonit>1.0){
		//croonitx=pow(croonit+(croonit-1.0)*100.0,4)*200.0;}
		//croonit+=(croonit-1.0)*1000.0
	//truv.x-=sqrt((UV.x));dfggbj
	//truv.x-=pow((UV.x),2)*croonitx;
	//truv.y-=pow(croonit,2)*1.0*(UV.y-0.5)*(1.0-truv.x);
	//float croonitx=pow(croonit,6)*700.0;
	//truv.x-=pow((-UV.x+1.04),2)*croonitx;
	float offsetk=sqrt(1.0/croonit+0.25/croonit/croonit)-0.5/croonit;
	//truv.x=UV.x+pow((UV.x-offset),2)*croonitx-offset;
	//truv.x = 1.0 - pow(1.0 - UV.x, 2.0)*;
	vec2 truv=vec2(UV.x+pow((UV.x-offsetk),2)*croonit-offsetk,UV.y);
	COLOR=texture(TEXTURE,truv);
	
	//COLOR=vec4(truv,1.0,1.0);
	if (truv.x<0.0){
		COLOR.a=0.0;}
	if (truv.x>1.0){
		COLOR.a=0.0;}
	//if (UV.x>offsetk){
		//COLOR=vec4(1);
	//}
}
//
//void light() {
	//// Called for every pixel for every light affecting the CanvasItem.
	//// Uncomment to replace the default light processing function with this one.
//}
