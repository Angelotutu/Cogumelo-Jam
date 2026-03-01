/// @desc ?

//sair
if image_index == 0
{
	if room == rm_missao1 //fase 1
	{
		global.entregouFase1 = true;
	}
	else if room == rm_missao2 //fase 2
	{
		global.entregouFase2 = true;
	}
	else //fase 3
	{
		global.entregouFase3 = true;
	}
	oUiEntregas.mode = STATE_MODE.VOLTANDOSUCESSO;

}

