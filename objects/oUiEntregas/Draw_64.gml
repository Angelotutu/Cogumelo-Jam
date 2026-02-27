/// @desc ?
draw_sprite(sUiEntregas,spriteShow,w - menosW - 16,16);

switch(mode)
{
	case STATE_MODE.ENTREGANDO:
		

		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas + 1));

		draw_text(w - menosW, 24 * 2.5,nome);

		draw_text(w - menosW, 24 * 4,planeta);

		draw_text(w - menosW, 24 * 5.5,"Tempo: " + string(round(timer)));

		draw_set_colour(c_white);
	
	break;
	
	case STATE_MODE.ENTREGOU:
		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas));

		draw_text(w - menosW, 48,"Sucesso");


		draw_set_colour(c_white);
	
	break;
	
	case STATE_MODE.FALHOU:
		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas + 1));

		draw_text(w - menosW, 48,"Falhou");


		draw_set_colour(c_white);
	
	break;
	
}



