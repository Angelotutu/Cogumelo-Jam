/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//variaveis
grav							= .3;
velh							= 0;
velv							= 0;
max_velh						= 4;
max_velv						= 5;
qtd_pulos						= 2;
face							= 1;

//variaveis para os esporos
dl_p							= 20;  //tempo e delay pra particula
tp_p							= dl_p;//tempo e delay pra particula
//variaveis para os esporos
dl_e							= 10;  //tempo e delay pro esporo
tp_e							= dl_e;//tempo e delay pro esporo
qtd_esporo						= 3;
ativo_esporo					= 0;
pode_esporo						= true;

tp_ec							= 0;//tempo e delay do esporo pro parry
dl_ec							= 60//tempo e delay do esporo pro parry
//trombada
tp_t							= 0; //tempo e delay pra trombada
dl_t							= 30;//tempo e delay pra trombada

//fazendo a variavel pra soltar esporos

estado_parado					= function()
{
	//aplicando gravidade
	gravidade();
	//fazendo o  personagem parar
	velh						= 0;
	//seu eu me mover 
	if(global.left or global.right) estado = estado_movendo;
	
}
estado_movendo					= function()
{
	//aplicando gravidade
	gravidade();
	//vendo a face
	if(global.right) face		= true;
	else if(global.left) face	= 0;
	
	//aplicando velocidade horizontal
	velh = (global.right - global.left) * max_velh;
	//seu eu não me mover 
	if not(global.left and global.right) estado = estado_parado;
}
gravidade						= function()
{
	
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	//se eu to no chao e aperto pular ou se aperto pular e tenho um pulo extra
	if((_chao and global.jump)) //or (global.jump and qtd_pulos >=1))
	{
		//gastando um pulo
		qtd_pulos--;
		//indo pra cima no pulo
		velv = -max_velv;
	}
	else //se eu não posso pular
	{
		//aplicando gravidade 
		velv += grav;
	}
	
	//se estou no chão
	if(_chao)
	{
		//ganho pulo extra
		qtd_pulos = 1;
	}
	//fazendo meu personagem não cair rapido pra sempre
	velv						= clamp(velv, -max_velv, max_velv);
	
	//se eu apertar o botao pra soltar esporo e eu não estou em um monstro
	if(global.esporo and pode_esporo) ativo_esporo = true;

	#region particula
	
	tp_p++;
	//vendo se posso tacar esporo
	if(tp_p >= dl_p)
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
	
	#endregion
	
}
esporo							= function()
{
	
	//vendo se posso tacar esporo
	if(tp_e >= dl_e and qtd_esporo > 0)
	{
		//show_message("conta");
		var _esporos			= instance_create_layer(x, y-8, "Esporos", obj_esporo);
		_esporos.image_blend	= c_lime;
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
estado	= estado_parado;