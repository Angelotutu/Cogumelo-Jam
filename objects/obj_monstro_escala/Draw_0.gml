/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor






draw_sprite_ext(spr_monstro, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, .5);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, blend, image_alpha);
if(debug) draw_circle(x, y, dis, 1);
if(debug) draw_circle(x, y, dis_min, 1);
if(debug) draw_text(x-64, y-64, txt_debug);
