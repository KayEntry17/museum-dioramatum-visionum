shader_type canvas_item;

uniform float anim : hint_range(0.0, 3.14/2.0) = 0.0;
//uniform float perspective = 1.2;

void fragment()
{

    vec2 truv = UV - vec2(1.0, 0.5);
	
    COLOR = texture(TEXTURE, truv);
}