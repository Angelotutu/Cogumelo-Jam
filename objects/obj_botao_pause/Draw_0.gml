/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause)
{
	image_alpha = 1;
}
else
{
	image_alpha	= 0;
	exit;
}

////setando coisas
//draw_set_halign(1);
//draw_set_valign(1);
//draw_set_color(cor);
//draw_set_font(fnt_normal);
////texto
//draw_text_transformed(x, y, string(global.text[global.idioma][text]), tam, tam, 0);
////trocando so a cor
//draw_set_color(c_white);
////desenhando o cubinho
//draw_sprite_ext(spr_dash, 0, x, y, tam, tam, 0, c_white, ativo);
////desetando coisas
//draw_set_halign(0);
//draw_set_valign(0);
//draw_set_color(c_white);
//draw_set_font(-1);

//draw_self();


//setando coisas
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
draw_set_font(fnt_normal);

//definindo o alpha pro cube
draw_set_alpha(cube)
//desenhando o cubinho atrás da primeira letra
var _w = string_width(txt);
draw_sprite_ext(spr_select, 0, x - (_w / 2)-cube_x, y, tam, tam, 0, c_white, ativo);
//resetando so o alpha
draw_set_alpha(global.pause);
draw_set_color(cor);
//desenhando o texto
draw_text_transformed(x, y, txt, tam, tam, 0);



//resetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_white);
draw_set_font(-1);
