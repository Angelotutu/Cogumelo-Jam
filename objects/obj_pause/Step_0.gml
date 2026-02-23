/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(global.start) global.pause = !global.pause;
ativo = global.pause;

//pegando o tamanho da cena
if(instance_exists(obj_obrigatorio))
{
	var _ob		= obj_obrigatorio;
	cam_x		= _ob.cam_x;
	cam_y		= _ob.cam_y;
	
}

//show_debug_message(global.options);
