/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


cor					= global.c_azul;
ativo				= 0;
cam_x				= 0;
cam_y				= 0;

_fullscreen		= instance_create_layer(x, y, "Options2", obj_botao_options);
_fullscreen.screen	= true;
_x				= instance_create_layer(x, y, "Options2", obj_botao_options);
_x.voltar			= true;
_musica			= instance_create_layer(x, y, "Options2", obj_botao_options);
_musica.musica		= true;
_sons			= instance_create_layer(x, y, "Options2", obj_botao_options);
_sons.sons			= true;
_x				= instance_create_layer(x, y, "Options2", obj_botao_options);
_x					= true;
