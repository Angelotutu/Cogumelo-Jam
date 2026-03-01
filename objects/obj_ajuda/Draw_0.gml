/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//desenhando a colisão
draw_sprite_ext(sprite_index, 0, x ,y, image_xscale, image_yscale, 0, c_white, 1);
if not(pode)exit;


if not(normal or (sem_consumir and !consumo) or (consumindo and consumo)) exit;

//setando coisas
draw_set_halign(1);
draw_set_valign(1);
draw_set_font(fnt_normal);
//texto
var _txt	= global.text[global.idioma][texto];
var _w		= string_width(_txt)
//escrevendo o texto
draw_text_transformed(x, y, _txt, 1, 1, 0);
//desenhando o botao
draw_sprite_ext(sprite, 0, x+_w+w ,y+h, 1.8, 1.8, 0, c_white, 1);

//desetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_font(-1);

