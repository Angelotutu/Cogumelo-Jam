/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//setando coisas
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
draw_set_font(fnt_normal);

//pegando o texto da variavel global com o idioma setado!
//texto
var _texto = string(global.text[global.idioma][12]);
//pegando a onde começa o texto
//var _largura = string_width(_texto);

//posição do início do texto
//var _x_inicio = x - (_largura / 2);

//desenhando o texto
draw_text_transformed(512/2, 288/2.5, _texto, 1, 1, 0);
//resetando coisas
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_white);
draw_set_font(-1);
