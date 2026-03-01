// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações



//entregas
global.TempoEntregas = 10;
global.IncrementarTempo = 5;
global.EntregasRealizadas = 0;
global.estaComEntrega = false;


//variaveis para os inputs
global.pause				= 0;
global.start				= 0;
global.restart				= 0;
global.left					= 0;
global.right				= 0;
global.up					= 0;
global.down					= 0;
global.jump					= 0;
global.esporo				= 0;
global.confirmar			= 0;
global.voltar				= 0;
global.acao					= 0;
//global.troca				= 0;

//variaveis para os botoes;
global.botaoh				= 0;
global.botaov				= 0;

//variavel pra effeitos
global.shake				= 0;

//cores padrões
global.c_azul				= $FFA84A25;

//vendo se estou controlando o monstro
//global.monstro				= false;

//menus
global.menu					= true;
global.options				= true;
global.fullscreen			= 0;
global.musica				= .5;
global.som					= .5;

function som(_snd = snd_cair_ms)
{
	// toca o som e guarda o id da instância
	var _inst = audio_play_sound(_snd, 1, false);

	// aplica o volume (0 a 1)
	audio_sound_gain(_inst, global.som, 0);
}

function screenshake(_shake)
{
	global.shake			= _shake;
}

function input()
{
	//setando o analogico
	var _axish				= gamepad_axis_value(0, gp_axislh);
	var _axisv				= gamepad_axis_value(0, gp_axislv);
	//fazendo as funções funcionarem no teclado e no controle
	global.left				= keyboard_check(vk_left) or keyboard_check(ord("A")) or gamepad_button_check(0, gp_padl) or _axish < -.3;
	global.right			= keyboard_check(vk_right) or keyboard_check(ord("D")) or gamepad_button_check(0, gp_padr) or _axish > .3;
	global.up				= keyboard_check(vk_up) or keyboard_check(ord("W")) or gamepad_button_check(0, gp_padu) or _axisv < -.3;
	global.down				= keyboard_check(vk_down) or keyboard_check(ord("S")) or gamepad_button_check(0, gp_padd) or _axisv > .3;
	global.jump				= keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1);
	global.esporo			= keyboard_check_pressed(ord("K")) or keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face2);
	global.start			= keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start);
	global.restart			= keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(0, gp_select);
	global.confirmar		= keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1);
	global.voltar			= keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face2);
	global.acao				= keyboard_check_pressed(ord("L")) or keyboard_check_pressed(ord("C")) or gamepad_button_check_pressed(0, gp_face3);
	//global.troca			= keyboard_check_pressed(ord("E")) or keyboard_check_pressed(ord("C")) or gamepad_button_check_pressed(0, gp_face3);
	//fazendo o ponteiro do mouse original sumir
	window_set_cursor(cr_none);
	
}


#region Traduções

global.idioma		= 0;

#region Português
{
	global.text[0][0] = "Jogar";
	global.text[0][1] = "Opções";
	global.text[0][2] = "Creditos";
	global.text[0][3] = "Idioma";
	global.text[0][4] = "Sair";
	global.text[0][5] = "Opções:";
	global.text[0][6] = "Musicas";
	global.text[0][7] = "Sons";
	global.text[0][8] = "Tela cheia";
	global.text[0][9] = "@Angelo_tutu:";
	global.text[0][10] = "@Imytator:";
	global.text[0][11] = "@MateusEMS:";
	global.text[0][12] = "GameDevloper\n Angelo_tutu\n MateusEMS\n Musicas e Audios\n Angelo_tutu\n Arte\n Imytator";
	global.text[0][13] = "Pause:";
	global.text[0][14] = "Retornar";
	global.text[0][15] = "Reiniciar";
	global.text[0][16] = "Opções";
	global.text[0][17] = "Menu";
	global.text[0][18] = "Ande com:";
	global.text[0][19] = "Pule com:";
	global.text[0][20] = "Escale a parede usando o monstro com:";
	global.text[0][21] = "Usar portal:";
	global.text[0][22] = "Pegue a encomenda\n antes de prossguir com:";
	global.text[0][23] = "Use:";
	global.text[0][24] = "Para se defender e consumir o inimigo!";

}
#endregion
#region English
{
	global.text[1][0] = "Play";
	global.text[1][1] = "Options";
	global.text[1][2] = "Credits";
	global.text[1][3] = "Language";
	global.text[1][4] = "Exit";
	global.text[1][5] = "Options:";
	global.text[1][6] = "Music";
	global.text[1][7] = "Sounds";
	global.text[1][8] = "Full screen";
	global.text[1][9] = "Angelo_tutu";
	global.text[1][10] = "Imytator";
	global.text[1][11] = "MateusEMS";
	global.text[1][12] = "GameDevloper\n Angelo_tutu\n MateusEMS\n Music and Sons\n Angelo_tutu\n Arte\n Imytator";
	global.text[1][13] = "Pause:";
	global.text[1][14] = "Return";
	global.text[1][15] = "Restart";
	global.text[1][16] = "Options";
	global.text[1][17] = "Menu";
	global.text[1][18] = "Ande com:";
	global.text[1][19] = "Pule com:";
	global.text[1][20] = "Escale a parede usando o monstro com:";
	global.text[1][21] = "Usar portal:";
	global.text[1][22] = "Pegue a encomenda\n antes de prossguir com:";
	global.text[1][23] = "Use:";
	global.text[1][24] = "Para se defender e consumir o inimigo!";
}
#endregion
#endregion

