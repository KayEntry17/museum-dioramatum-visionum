shader_type canvas_item;
uniform float croonit:hint_range(0.0, 1.2, 0.01);
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
	
	//truv.x-=pow((-UV.x+1.0),2)*chkhjkhjkhroonitx;
	//if (croonit>1.0){
		//croonitx=pow(croonit+(croonit-1.0)*10.0,4)*200.0;}
		//croonit+=(croonit-1.0)*1000.0
	//truv.x-=sqrt((UV.x));dfggbj
	//truv.x-=pow((UV.x),2)*croonitx;
	//truv.y-=pow(croonit,2)*1.0*(UV.y-0.5)*(1.0-truv.x);
	//float croonitx=pow(croonit,6)*700.0;
	//truv.x-=pow((-UV.x+1.04),2)*croonitx;
		//vec2 truv=UV;
	//float croonitx=pow(croonit,2)*700.0;
	//truv.x=UV.x+pow((UV.x-offset),2)*croonitx-offset;
	//truv.x = 1.0 - pow(1.0 - UV.x, 2.0)*;
	//if (UV.x>offsetk){
		//COLOR=vec4(1);
	//}	
	//COLOR=vec4(truv,1.0,1.0);
void fragment() {

	float croonitx=pow(croonit,5)*200.0;

	float offsetk=(2.0*croonitx)/(2.0*croonitx+1.0+sqrt(4.0*croonitx+1.0))+offset;

	vec2 truv=vec2(UV.x+pow((UV.x-offsetk),2)*croonitx-offsetk,UV.y);
	truv.y-=mix(croonit, sqrt(croonit), 0.4)*0.5*(UV.y-0.5)*(1.0-truv.x);
	if (croonitx!=0.0){
	COLOR.rgb=texture(TEXTURE,truv).rgb*(1.0-croonit);}
	COLOR=texture(TEXTURE,truv);
	COLOR.rgb=mix(COLOR.rgb,vec3(0.0),clamp(croonit/2.0-0.05,0,1.0));
	if (UV.x<offsetk){
		COLOR.a=0.0;}
	if (truv.x>1.0){
		COLOR.a=0.0;}

}
//
//void light() {
	//// Called for every pixel for every light affecting the CanvasItem.
	//// Uncomment to replace the default light processing function with this one.
//}
