/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//setando coisas
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(cor);
draw_set_alpha(ativo);
draw_set_font(fnt_normal);
//fundo
draw_sprite_ext(spr_square, 0, cam_x+512/2, cam_y+228/1.5, 7, 7, 0, cor, ativo)
//mudando somente a cor
draw_set_color(c_white);
//texto
var _text	= string(global.text[global.idioma][5]);
draw_text_transformed(cam_x+512/2, cam_y+512/8, _text, 1.5, 1.5, 0);
//desetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(-1);

