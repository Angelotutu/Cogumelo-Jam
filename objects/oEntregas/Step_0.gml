/// @desc ?

if global.pause
{
	exit;
}


if instance_exists(obj_player) && global.estaComEntrega == false && !instance_exists(oUiEntregas)
{
	var _colisao = collision_rectangle(x - 16,y,x+sprite_width + 16, y + sprite_height,obj_player, 0, 1);
	
	if _colisao && global.acao
	{
		if obj_player.estado == obj_player.estado_parado || obj_player.estado == obj_player.estado_movendo()
		{
			//show_message("ativou");
			global.estaComEntrega = true;
			
			var _entrega = instance_create_depth(x,y,0,oUiEntregas);
			_entrega.nome = cliente[global.EntregasRealizadas];
			_entrega.planeta = planeta[global.EntregasRealizadas];
		}
	}
}
