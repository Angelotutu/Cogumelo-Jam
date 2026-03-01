/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause)
{
	velh = 0;
	velv = 0;
	exit;
}

if(manso)
{
	image_xscale					= 1;
	image_yscale					= 1;
	esporos();
	//to manso
	if(consumido)
	{
		//skins
		idle							= spr_lagarto_idle_consumido;
		run								= spr_lagarto_walking_consumido;
		run_parede						= spr_lagarto_parede_run;
		idle_parede						= spr_lagarto_parede_idle;
		jump							= spr_lagarto_idle_consumido;
		//o player esta em mim	
		//estado					= estado_parado; //fui feito p
		if(escala)
		{
			//chacando se tem aprede
			
			var _parede				= place_meeting(x+1, y, obj_block) or place_meeting(x-1, y, obj_block);
			if(_parede)
			{			
				if(face)xx			= 5;
				estado		= estado_escalar;
			}
			else xx = 0;
			
		}
	}
	else
	{
		//skins
		idle							= spr_lagarto_idle;
		run								= spr_lagarto_walking;
		jump							= spr_lagarto_idle;
		estado					= estado_vazio;
	}
	
}
else
{
	//se minha vida for menor ou 0 eu fico manso
	if(vida<=0) manso = true;
	
}

estado();


