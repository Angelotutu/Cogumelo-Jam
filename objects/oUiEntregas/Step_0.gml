/// @desc ?


switch(mode)
{
	case STATE_MODE.ENTREGANDO:
		timer -= 1/60;

		//acabou tempo
		if (timer <= 0)
		{
			spriteShow = 2;
			timer = 4;
			global.estaComEntrega = false;
			mode = STATE_MODE.FALHOU;
		}

	
	break;
	
	case STATE_MODE.ENTREGOU:
		global.estaComEntrega = false;
		timer -= 1/60;
		spriteShow = 1;
		
		if (timer <= 0)
		{
			instance_destroy();
		}
	
	break;
	
	case STATE_MODE.FALHOU:
		timer -= 1/60;
	
		if (timer <= 0)
		{
			instance_destroy();
		}
	break;
	
}


