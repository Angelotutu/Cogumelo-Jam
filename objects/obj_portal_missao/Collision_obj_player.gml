/// @desc ?


if(global.acao and image_index == 0 and pode)
{
	var _t			= instance_create_layer(0, 0, "Transicao", obj_transicao);
	_t.essa_room	= essa_room;
	pode = false;
}

