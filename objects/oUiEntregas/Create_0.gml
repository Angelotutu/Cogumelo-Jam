/// @desc ?
w = display_get_gui_width();
h = display_get_gui_height();

//se cada missoa diminuir o tempo
tempo = [0, 20]

timer = global.TempoEntregas - tempo[global.EntregasRealizadas];
spriteShow = 0;

menosW = 130;

enum STATE_MODE
{
	ENTREGANDO,
	ENTREGOU,
	FALHOU,
}

mode = STATE_MODE.ENTREGANDO;