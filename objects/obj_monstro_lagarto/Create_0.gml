/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//
blend							= c_green;
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
txt_debug						= "Estado_parado";

//esporos
dl_p							= 30;
tp_p							= dl_p;

//trombada
dl_t							= 10;
tp_t							= 0;

//efeitos
cai								= false;

//não é a vida em si mais é isso
vida							= choose(3, 5);


//paisana
dl_a							= irandom_range(10, 120);
tp_a							= dl_a;
mov								= false;

//ostil
dis								= 150;
dis_min							= 50;
debug							= true;

//attack
dl_at							= irandom_range(30, 60);
tp_at							= 0;

//skins
idle							= spr_player_idle_corpo;
run								= spr_player_run_corpo;
jump							= spr_player_idle_corpo;
attack							= spr_player_run_corpo;
sprite							= idle;
xscale							= 1;
yscale							= 1;
escala							= true;

image_speed						= 0;
skin							= function(_skin = idle, _speed = .2, _grav = 1)
{
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	if(_grav = 2)
	{
		sprite				= _skin;
		image_speed			= _speed;
	}
	else if(_grav)
	{
		if(_chao)
		{
			sprite				= _skin;
			image_speed			= _speed;
		}
		
	}
	else
	{
		if(!_chao)
		{
			sprite				= _skin;
			image_speed			= _speed;
		}
	}

	
}
estado_parado					= function()
{
	txt_debug						= "Estado_parado";
	//aplicando gravidade
	gravidade();
	//colocando a skin
	skin();
	//fazendo o  personagem parar
	velh						= 0;
	//seu eu me mover 
	if(global.left or global.right) estado = estado_movendo;
	
}
estado_movendo					= function()
{
	txt_debug						= "Estado_movendo";
	//aplicando gravidade
	gravidade();
	//colocando a skin
	skin(run, .5);
	//vendo a face
	if(global.right) face		= true;
	else if(global.left) face	= 0;
	
	if(face)xscale = 1;
	else xscale = -1;
	
	//aplicando velocidade horizontal
	velh = (global.right - global.left) * max_velh;
	//seu eu não me mover 
	if (!global.left and !global.right) estado = estado_parado;
}
gravidade						= function()
{
	
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	//colocando a skin
	skin(jump, 0, 0);
	//se eu to no chao e aperto pular ou se aperto pular e tenho um pulo extra
	if((_chao and global.jump and !escala))// or (global.jump and qtd_pulos >=1))
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
	txt_debug						= "Estado_escalar";
	//chacando se tem aprede
	var _parede				= place_meeting(x+1, y, obj_block) or place_meeting(x-1, y, obj_block);
	//se não tiver parede volto a andar
	if not(_parede) estado	= estado_parado;

	//aplicando velocidade vertical
	velv = (global.down - global.up) * max_velv;
	//aplicando velocidade horizontal
	velh = (global.right - global.left) * max_velh;
	
	if(global.down or global.up) skin(run,.4,2);
	else skin(,, 2);
	
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
	txt_debug						= "Estado_trombada";
	image_xscale					= 1;
	image_index						= 0;
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
		estado	= estado_ostil;
	}
	
}
estado_paisana					= function()
{
	txt_debug						= "Estado_paisana";
	if(velh > 0)
	{
		//colocando a skin
		skin(run, .4);
		//virando
		xscale = 1;
	}
	else if(velh < 0)
	{
		//colocando a skin
		skin(run, .4);
		//virando
		xscale = -1;
	}
	else
	{
		//colocando a skin
		skin();

	}
	
	//vendo a distancia minha e do player
	if(instance_exists(obj_player))
	{
		var _dis = point_distance(x, y, obj_player.x, obj_player.y);	
		
		//se for menor que minha distancia vou pro estado ostil
		if(_dis <= dis)
		{
			//colocando a skin
			skin(attack, .2);
			estado = estado_ostil;
		}
		
	}
	
	//se eu me movimento
	//if(velh > 0 or velh < 0) skin(idle);
	//aumentando o tempo de paisana
	tp_a++;
	//se o tempo for maior que o delay
	if(tp_a>=dl_a)
	{
		velh							= 0;
		mov								= choose(0, 1);
		face							= choose(0, 1);
		//reseto o tempo
		dl_a							= irandom_range(10, 120);
		tp_a							= 0;
	}
	
	////se eu to virado pra direita
	if(face)
	{
		//viro pra direita
		image_xscale = 1;
		if(mov) velh = 1;
		//se tiver uma parede na minha frente eu vou pra tras
		if(place_meeting(x+2, y, obj_block)) face = 0;
		//se não tiver chao na minha frente eu vou pra tras
		if not(place_meeting(x+5, y+5, obj_block)) face = 0;
		
	}
	else
	{
		//viro pra direita
		image_xscale = -1;
		if(mov) velh = -1;
		//se tiver uma parede na minha frente eu vou pra tras
		if(place_meeting(x-2, y, obj_block)) face = 1;
		//se não tiver chao na minha frente eu vou pra tras
		if not(place_meeting(x-5, y+5, obj_block)) face = 1;
		
	}
	
	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	if not(_chao)
	{
		//colocando a skin
		skin(jump, 0, 0);
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
estado_ostil					= function()
{
	txt_debug						= "Estado_ostil";
	
	
	//se eu to manso
	if(manso) estado = estado_vazio;
	
	//se o player existe
	if(instance_exists(obj_player))
	{
		//defino ele
		var _p = obj_player;
		//pego a minha distancia
		var _dis = point_distance(x, y, _p.x, _p.y);			
		//se a distancia for maior que minha distancia vou pro estado paisana
		if(_dis > dis)
		{
			//colocando a skin
			skin();
			//virando
			xscale = 1;
			velh = 0;
			estado = estado_paisana;
			
		}
		
		//se a distancia for maior que a distancia minima
		if(_dis > dis_min)
		{
			
			////se eu to virado pra direita
			if(x <= _p.x)
			{
				//viro pra direita
				image_xscale = 1;
				velh = 1;
				//se tiver uma parede na minha frente eu vou pra tras 		//se não tiver chao na minha frente eu vou pra tras
				//colocando a skin
				skin(run, .4);
				//virando
				xscale = 1;
				
			}
			else
			{
				//viro pra direita
				image_xscale = -1;
				velh = -1;
				//colocando a skin
				skin(run, .4);
				//virando
				xscale = -1;
			
									
				
			}
			//image_speed = 0;
			//image_index = 0;
			//image_xscale = 1;
			
		}
		
		if(_dis <= dis_min or tp_at>1) //or sprite_index == attack)//se não for maior
		{
			//eu paro e ataco
			velh	= 0;
			sprite	= attack;
			tp_at++;
			if(tp_at>=dl_at)
			{
				//attack
				image_speed = 0.4;
				if(image_index >= image_number -2)
				{
					//atack aqui
					image_xscale = 3;
					
				}
				
				if(image_index >= image_number)
				{
					//resetando
					dl_at	= irandom_range(30, 60);
					tp_at	= 0;
							
				}
				
				
			}
			else
			{
				image_speed = 0;
				image_index = 0;
				image_xscale = 1;
			}
			
			
		}
		
	}
	
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
estado_vazio					= function()
{
	txt_debug						= "Estado_vazio";
	velh = 0;
	skin(idle);

	//chacando se to pisando no chao
	var _chao					= place_meeting(x, y+1, obj_block);
	if not(_chao)
	{
		//colocando a skin
		skin(jump, 0, 0);
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


#region Monstro que escala
#endregion


estado							= estado_paisana;