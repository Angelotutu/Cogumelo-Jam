/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.menu)
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



//setando coisas
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(cor);
draw_set_font(fnt_normal);

//pegando o texto da variavel global com o idioma setado!
//texto
var _texto = string(global.text[global.idioma][text]);
//pegando a onde começa o texto
var _largura = string_width(_texto);

//posição do início do texto
var _x_inicio = x - (_largura / 2);

//definindo o alpha pro cube
draw_set_alpha(cube)
//desenhando o cubinho atrás da primeira letra
draw_sprite_ext(spr_select, 0, _x_inicio-cube_x, y, tam, tam, 0, c_white, ativo);
//resetando so o alpha
draw_set_alpha(1);
//desenhando o texto
draw_text_transformed(x, y, _texto, tam, tam, 0);

//resetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_white);
draw_set_font(-1);
