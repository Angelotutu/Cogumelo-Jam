/// @desc ?

if(instance_exists(obj_transicao))exit;
draw_sprite(sUiEntregas,spriteShow,w - menosW - 8,16);

switch(mode)
{
	case STATE_MODE.ENTREGANDO:
		

		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas + 1));

		draw_text(w - menosW, 24 * 2.5,nome);

		draw_text(w - menosW, 24 * 4,planeta);
		
		draw_text(w - menosW, 24 * 5.5,"Qualidade " +string(qualidade) + "%");
		
		draw_set_halign(fa_center);
		draw_set_font(FontTimer);
	
		draw_text(w /2, 16,"Tempo: " + string(round(timer)));
	
	break;
	
	case STATE_MODE.ENTREGOU:
		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas));

		draw_text(w - menosW, 48,"Sucesso");

		draw_set_halign(fa_center);
		draw_set_font(FontTimer);
		
		draw_text(w /2, 16,"Volte o mais rapido pro portal");
	break;
	
	case STATE_MODE.FALHOU:
		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas + 1));

		draw_text(w - menosW, 48,"Falhou");
	
	break;
	
	case STATE_MODE.VOLTANDO:
		draw_set_colour(c_black);

		draw_text(w - menosW, 24,"Entrega "+ string(global.EntregasRealizadas));

		draw_text(w - menosW, 48,"Realizada :)");
		
		
		draw_set_halign(fa_center);
		draw_set_font(FontTimer);
	
		draw_text(w /2, 16,"Tempo: " + string(round(timer)));
	break;
	
	case STATE_MODE.VOLTANDOFALHA:
		draw_set_colour(c_black);
		draw_set_alpha(0.7);
		
		draw_rectangle(0,0,w,h,false);
		
		draw_set_alpha(1);
		draw_set_colour(c_white);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(FontTimer);
		
		draw_text(w /2, h/2.5,"GAME OVER");
		draw_text(w /2, h/1.5,"aperte ENTER para tentar de novo");
	break;

	case STATE_MODE.VOLTANDOSUCESSO:
		
	break;
	
}

draw_set_halign(0);
draw_set_valign(0);
draw_set_colour(c_white);
draw_set_font(-1);


