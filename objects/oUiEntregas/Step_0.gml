/// @desc ?

if global.pause
{
	exit;	
}

switch(mode)
{
	case STATE_MODE.ENTREGANDO:
		timer -= 1/60;

		//acabou tempo
		if (timer <= 0)
		{
			spriteShow = 2;
			//timer = 4;
			global.estaComEntrega = false;
			mode = STATE_MODE.FALHOU;
		}

		if qualidade <= 0
		{
			spriteShow = 2;
			//timer = 4;
			global.estaComEntrega = false;
			mode = STATE_MODE.FALHOU;
		}
	break;
	
	case STATE_MODE.ENTREGOU:
		global.estaComEntrega = false;
		outroTimer -= 1/60;
		spriteShow = 1;
		
		if (outroTimer <= 0)
		{
			timer += global.IncrementarTempo;
			if instance_exists(oSpawn)
			{
				oSpawn.image_index = 0;	
			}
			mode = STATE_MODE.VOLTANDO;
			//instance_destroy();
		}
	
	break;
	
	case STATE_MODE.FALHOU:
		outroTimer -= 1/60;
		
		if (outroTimer <= 0)
		{
			if instance_exists(obj_player) && instance_exists(oSpawnPortal)
			{
				obj_player.x = oSpawnPortal.x;
				obj_player.y = oSpawnPortal.y;
			}
			instance_destroy();
		}
	break;
		
	case STATE_MODE.VOLTANDO:
		timer -= 1/60;
		
		if timer <= 0
		{
			spriteShow = 3;
			oSpawn.image_index = 1;	
			//global.EntregasRealizadas -= 1;
			mode = STATE_MODE.VOLTANDOFALHA;
		}
	break;
	
	case STATE_MODE.VOLTANDOFALHA:
		if instance_exists(obj_player)
		{
			obj_player.estado = obj_player.estado_gameover;
		}
	break;

	case STATE_MODE.VOLTANDOSUCESSO:
		spriteShow = 3;
	
		//ir para o lobby
		if(pode_transicao)
		{
			var _t			= instance_create_layer(0, 0, "Transicao", obj_transicao);
			_t.essa_room	= rm_lobby;
			pode_transicao	= false;
		}
		
	break;
	
}


