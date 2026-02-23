/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.options)
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
draw_set_color(cor);
draw_set_font(fnt_normal);

//pegando o texto da variavel global com o idioma setado!
//texto
var _txt_musicas	= string(global.text[global.idioma][6]);
var _txt_sons		= string(global.text[global.idioma][7]);
var _txt_fullscreen = string(global.text[global.idioma][8]);
var _txt_fullscreen = string(global.text[global.idioma][8]);
//pegando a onde começa o texto
var _l_m			= string_width(_txt_musicas);
var _l_s			= string_width(_txt_sons);
var _l_f			= string_width(_txt_fullscreen);

//posição do início do texto
var _xlm			= x - (_l_m / 2);
var _xls			= x - (_l_s / 2);
var _xlf			= x - (_l_f / 2);
//definindo o alpha pro cube
draw_set_alpha(cube)
//desenhando o cubinho atrás da primeira letra
draw_sprite_ext(spr_select, 0, xx-cube_x, y, tam, tam, 0, c_white, ativo);
//resetando so o alpha
draw_set_alpha(1);



if(voltar)
{
	xx				= x;
	txt				= "";
	//desenhando o x
	draw_sprite_ext(spr_x, 0, x, y, tam, tam, 0, c_navy, 1);
	
}
if(musica)
{
	xx				= _xlm;
	txt				= _txt_musicas;			
	
	//desenhando a barra
	draw_sprite_ext(spr_barra, 0, x, y, 5, 1, 0, c_white, 1);
	//desenhando o botao da barra
	draw_sprite_ext(spr_button_bar, 0, b_barra, y, tam, tam, 0, c_white, 1);
	//desenhando o texto
	draw_text_transformed(x, y-16, txt, tam, tam, 0);
	
}
if(sons)
{
	xx				= _xls;
	txt				= _txt_sons;
	//desenhando a barra
	draw_sprite_ext(spr_barra, 0, x, y, 5, 1, 0, c_white, 1);
	//desenhando o botao da barra
	draw_sprite_ext(spr_button_bar, 0, b_barra, y, tam, tam, 0, c_white, 1);
	//desenhando o texto
	draw_text_transformed(x, y-16, txt, tam, tam, 0);
}
if(screen)
{
	xx				= _xlf;
	txt				= _txt_fullscreen;
	//desenhando a caixa
	draw_sprite_ext(spr_caixa, global.fullscreen, xx-20, y, tam, tam, 0, c_white, 1);
	//desenhando o texto
	draw_text_transformed(x, y, txt, tam, tam, 0);
}


//resetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_white);
draw_set_font(-1);
