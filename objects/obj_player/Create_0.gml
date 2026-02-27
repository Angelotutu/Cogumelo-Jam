/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//variaveis
grav							= .3;
velh							= 0;
velv							= 0;
max_velh						= 3;
max_velv						= 5;
qtd_pulos						= 2;
face							= 1;
estado_text						= "";
//variaveis para os esporos
dl_p							= 20;  //tempo e delay pra particula
tp_p							= dl_p;//tempo e delay pra particula
//variaveis para os esporos
dl_e							= 10;  //tempo e delay pro esporo
tp_e							= dl_e;//tempo e delay pro esporo
qtd_esporo						= 3;
ativo_esporo					= 0;
pode_esporo						= true;
//parry
tp_ec							= 0;//tempo e delay do esporo pro parry
dl_ec							= 60//tempo e delay do esporo pro parry
//trombada
tp_t							= 0; //tempo e delay pra trombada
dl_t							= 30;//tempo e delay pra trombada
//squash squezze
squezze							= .3;
tamx							= 1;
tamy							= 1;
xscale							= 1;
yscale							= 1;
ld								= 1;
cai								= 0;
cab								= true;
cab_index						= 0;
dl_cab							= 6;
tp_cab							= dl_cab;
//entregas
entrega							= false;
vel_entregas					= 6;
//fazendo a variavel pra soltar esporos

//animações
sprite_cabeca					= spr_player_idle_cabeca;
sprite_index					= spr_player_idle_corpo;
image_speed						= .2;

estado_parado					= function()
{
	//definindo texto do estado
	estado_text					= "Estado_Parado";
	//colocando a animação
	anim();
	//aplicando gravidade
	gravidade();
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);

	//fazendo o  personagem parar
	velh						= 0;
	//seu eu me mover 
	if(global.left or global.right)
	{
		//efeito de squash squezze
		if(_chao)squash(1.5, .5);
		estado = estado_movendo;
	}
	
}
estado_movendo					= function()
{
	//definindo texto do estado
	estado_text					= "Estado_Movendo";
	//colocando a animação
	if(entrega) anim(spr_player_run_away_cabeca, spr_player_run_away_corpo, 1);
	else anim(spr_player_run_cabeca, spr_player_run_corpo, 1);
	//aplicando gravidade
	gravidade();
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	//vendo a face
	if(global.right and !face)
	{
		//efeito de squash squezze
		if(_chao)squash(1.5, .5);
		face		= true;
	}
	else if(global.left and face)
	{
		//efeito de squash squezze
		if(_chao)squash(1.5, .5);
		face	= 0;
	}
	//aplicando velocidade horizontal
	if(entrega) velh = (global.right - global.left) * vel_entregas;
	else velh = (global.right - global.left) * max_velh;
	//seu eu não me mover 
	if(!global.left and !global.right) estado = estado_parado;
}
gravidade						= function()
{
	
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	//se eu to no chao e aperto pular ou se aperto pular e tenho um pulo extra
	if((_chao and global.jump)) //or (global.jump and qtd_pulos >=1))
	{
		//animando
		if(cab)sprite_cabeca = spr_player_begin_jump_cabeca;
		sprite_index = spr_player_begin_jump_corpo;
		image_index = 0;
		image_speed	= .3;
		//efeito de squash squezze
		squash(.5, 1.5);
		//gastando um pulo
		qtd_pulos--;
		//indo pra cima no pulo
		velv = -max_velv;
	}
	else if(!_chao) //se eu não posso pular
	{
		//aplicando gravidade 
		velv += grav;
		//colocando a animação
		//anim(spr_player_falling_corpo, spr_player_falling_cabeca, .5, 0);
		// Subindo
		// Se ainda está na animação de início, espera terminar
		if (velv < -1)
		{
		    if(cab)sprite_cabeca = spr_player_up_jump_cabeca;
		    sprite_index = spr_player_up_jump_corpo;
		}
		// Transição (topo do pulo)
		else if (abs(velv) <= 1)
		{
		    if(cab)sprite_cabeca = spr_player_begin_fall_cabeca;
		    sprite_index = spr_player_begin_fall_corpo;
		}
		// Caindo
		else if (velv > 1)
		{
		    if(cab)sprite_cabeca = spr_player_falling_cabeca;
		    sprite_index = spr_player_falling_corpo;
		}
			
	}
	
	//se estou no chão
	if(_chao)
	{
		if(cai)
		{
			//efeito de squash squezze
			squash(2, .5);
			cai = false;
		}
		//ganho pulo extra
		qtd_pulos = 1;
	}
	else cai = true;
	//fazendo meu personagem não cair rapido pra sempre
	velv						= clamp(velv, -max_velv, max_velv);
	
	//se eu apertar o botao pra soltar esporo e eu não estou em um monstro
	if(global.esporo and pode_esporo)
	{
		//efeito de squash squezze
		squash(1.5, .5);
		//colocando a animação
		anim(spr_player_attack_cabeca, , .2, 2);
		ativo_esporo = true;
	}
	#region particula
	
	tp_p++;
	//vendo se posso tacar esporo
	if(tp_p >= dl_p)
	{

		var _esporos			= instance_create_layer(x-irandom_range(-20, 20), y-irandom_range(4, 20), "Particulas", obj_particula);
		_esporos.image_index	= choose(5, 4, 3);
		_esporos.image_speed	= .5;
		_esporos.image_blend	= c_purple;
		_esporos.image_alpha	= .2;
		_esporos.vspeed			= -.02;
		//_esporos.image_xscale	= 1;
		//_esporos.image_yscale	= 1;
		tp_p					= 0;
	}
	
	#endregion
	
}
esporo							= function()
{
	
	//vendo se posso tacar esporo
	if(tp_e >= dl_e and qtd_esporo > 0)
	{
		//show_message("conta");
		var _esporos			= instance_create_layer(x, y-8, "Esporos", obj_esporo);
		_esporos.image_blend	= c_purple;
		_esporos.image_alpha	= .2;
		_esporos.vspeed			= -.8;
		_esporos.image_xscale	= 2;
		_esporos.image_yscale	= 2;
		qtd_esporo				--;
		tp_e					= 0;
		
	}
	
	
}
estado_trombada					= function()
{
	//definindo texto do estado
	estado_text					= "Estado_Trombada";
	//fazendo trombada
	//se to virado pro lado vou pra essa direção
	//é um efeito pra suavilizar a gameplay
	if(face) velh		+=0.2;
	else velh		-=0.2;
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	//se eu não estou no chao desço rapido
	if not(_chao)velv		+=.5;
	//aumentando o tp pra me mover
	tp_t++;
	if(tp_t>=dl_t or _chao) //se eu estou no chao ou ja posso me mocer
	{
		//meu tempo reinicia
		tp_t	= 0;
		//e volto pro meu estado original
		estado	= estado_parado;
	}
	
}
estado_consumidor				= function()
{
	//definindo texto do estado
	estado_text					= "Estado_Consumindo";
	//sumindo
	image_alpha = 0;
	//tp_p++;
	//vendo se posso tacar esporo
	if(tp_p >= dl_p/2)
	{
		var _esporos			= instance_create_layer(x-irandom_range(-20, 20), y-irandom_range(4, 20), "Particulas", obj_particula);
		_esporos.image_index	= choose(5, 4, 3);
		_esporos.image_speed	= .5;
		_esporos.image_blend	= c_lime;
		_esporos.image_alpha	= .2;
		_esporos.vspeed			= -.02;
		//_esporos.image_xscale	= 1;
		//_esporos.image_yscale	= 1;
		tp_p					= 0;
	}
	
	//saindo do consumidor
	if(global.esporo)
	{
		//aparecendo
		image_alpha				= 1;
		//saindo do monstro
		estado					= estado_parado;
	}
	
}
squash							= function(_tamx = image_xscale, _tamy = image_yscale)
{
	tamx						= _tamx;
	tamy						= _tamy;
}
anim							= function(_spr_cabeca = spr_player_idle_cabeca, _spr_corpo = spr_player_idle_corpo, _vel = .2, _grav = 1)
{
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	
	if(_grav ==2) //se não
	{
			image_speed					= _vel;
			sprite_cabeca				= _spr_cabeca;
			cab_index					= 0;
			cab							= false;

	}
	else if(_grav) //se a variavel grav for verdadeira
	{
		//so faço a aanimação se estou no chao
		if(_chao)
		{
			image_speed					= _vel;
			sprite_index				= _spr_corpo;
			if(cab)sprite_cabeca		= _spr_cabeca;
		}
		
	}
	else //se não
	{
		//so faço a animação quando estou fora do chao
		if(!_chao)
		{
			image_speed					= _vel;
			sprite_index				= _spr_corpo;
			if(cab)sprite_cabeca		= _spr_cabeca;
		}
	}
	
	
	
}
estado	= estado_parado;