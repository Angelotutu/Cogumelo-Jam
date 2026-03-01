/// @desc ?
w = display_get_gui_width();
h = display_get_gui_height();

//transicao
pode_transicao = true;

//dados das entregas, adicionar para a quantidade de fases, ex: marte 1 fase, urano 2 fase etc

planeta = ["Marte", "Urano"];
cliente = ["Francismar","Malson"];

qualFase = 1;
nome = "";
planeta = "";

if room == rm_missao1 //fase 1
{
	qualFase = 1;
	nome = "Marte";
	planeta = "Francismar";
}
else if room == rm_missao2 //fase 2
{
	qualFase = 2;
	nome = "Urano";
	planeta = "Malson";
}
else //fase 3
{
	qualFase = 3;
	nome = "Urano";
	planeta = "Malson";
}

//se cada missoa diminuir o tempo
tempo = [0, 20]

timer = global.TempoEntregas;
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
	FALHOUQUALIDADE, /////
	VOLTANDO,
	VOLTANDOFALHA,
	VOLTANDOSUCESSO,
}

mode = STATE_MODE.ENTREGANDO;