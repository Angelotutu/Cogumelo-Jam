/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor




ativo			= 0;
cor				= c_red;

instance_create_layer(0, 0, "Obrigatorio", obj_move_button);


var _return			= instance_create_layer(0, 0, "Options", obj_botao_pause);
_return.retornar	= true; 
var _restart		= instance_create_layer(0, 0, "Options", obj_botao_pause);
_restart.reiniciar	= true;
var _options		= instance_create_layer(0, 0, "Options", obj_botao_pause);
_options.options	= true;
var _menu			= instance_create_layer(0, 0, "Options", obj_botao_pause);
_menu.menu			= true;

