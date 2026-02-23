/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//variaveis necessarias
velh							= 0;
velv							= 0;
//variaveis mudaveis
grav							= 0.5;
max_velh						= 1.5;
max_velv						= 1.5;
qtd_pulos						= 2;
//manso
manso							= false;
consumido						= false;
face							= 1;

//esporos
dl_p							= 30;
tp_p							= dl_p

//trombada
dl_t							= 10;
tp_t							= 0;

//efeitos
cai								= false;

//não é a vida em si mais é isso
vida							= choose(3, 5);

//estado_paisana					= function()
//{
//	//susegando
//	vel
//}


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
	if((_chao and global.jump and !escala) or (pulos and global.jump and qtd_pulos >=1))
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
		//se eu cai
		if(!cai)
		{
			var _p1				= instance_create_layer(x-16, y, "Esporos", obj_particula);
			var _p2				= instance_create_layer(x+16, y, "Esporos", obj_particula);
			_p1.image_speed		= .5;
			_p1.image_blend		= c_white;
			_p1.image_alpha		= .2;
			_p1.vspeed			= -1;
			_p2.image_speed		= .5;
			_p2.image_blend		= c_white;
			_p2.image_alpha		= .2;
			_p2.vspeed			= -1;
			
			screenshake(2);
			cai					= true;
		}
		//ganho pulo extra
		qtd_pulos = 1;
	}
	else cai = false;
	//fazendo meu personagem não cair rapido pra sempre
	//velv						= clamp(velv, -max_velv, max_velv);

	#region particula
	
	
	
	#endregion
	
}
estado_escalar					= function()
{
	//chacando se tem aprede
	var _parede				= place_meeting(x+1, y, obj_block) or place_meeting(x-1, y, obj_block);
	//se não tiver parede volto a andar
	if not(_parede) estado	= estado_parado;
	
	//aplicando velocidade vertical
	velv = (global.down - global.up) * max_velv;
	//aplicando velocidade horizontal
	velh = (global.right - global.left) * max_velh;
	
}
esporos							= function()
{
	tp_p++;
	//vendo se posso tacar esporo
	if(tp_p >= dl_p)
	{
		var _esporos			= instance_create_layer(x-irandom_range(-50, 50), y-irandom_range(4, 20), "Particulas", obj_particula);
		_esporos.image_index	= choose(5, 4, 3);
		_esporos.image_speed	= .5;
		_esporos.image_blend	= c_lime;
		_esporos.image_alpha	= .2;
		_esporos.vspeed			= -.02;
		//_esporos.image_xscale	= 1;
		//_esporos.image_yscale	= 1;
		tp_p					= 0;
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
		//tirando vida
		vida--;
		//e volto pro meu estado original
		estado	= estado_vazio;
	}
	
}
estado_vazio					= function()
{
	velh = 0;
	if(agua) velv = 0;
	else
	{
		//chacando se to pisando no chao
		var _chao					= place_meeting(x, y+1, obj_block);
		if not(_chao)
		{
			velv	+= grav;
			cai = false;
		}
		else
		{
			//se eu cai
			if(!cai)
			{
				var _p1				= instance_create_layer(x-16, y, "Esporos", obj_particula);
				var _p2				= instance_create_layer(x+16, y, "Esporos", obj_particula);
				_p1.image_speed		= .5;
				_p1.image_blend		= c_white;
				_p1.image_alpha		= .2;
				_p1.vspeed			= -1;
				_p2.image_speed		= .5;
				_p2.image_blend		= c_white;
				_p2.image_alpha		= .2;
				_p2.vspeed			= -1;
				
				screenshake(2);
				cai					= true;
			}
		}
	}
	
}


#region Monstro que escala
#endregion


estado							= estado_vazio;