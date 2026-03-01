/// @desc ?
w = display_get_gui_width();
h = display_get_gui_height();

//se cada missoa diminuir o tempo
tempo = [0, 20]

timer = global.TempoEntregas - tempo[global.EntregasRealizadas];
outroTimer = 4;
spriteShow = 0;

menosW = 148;
qualidade = 100;

aumentouTempo = true;

enum STATE_MODE
{
	ENTREGANDO,
	ENTREGOU,
	FALHOU,
	VOLTANDO,
	VOLTANDOFALHA,
	VOLTANDOSUCESSO,
}

mode = STATE_MODE.ENTREGANDO;


pode_transicao = true;