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
	esporos();
	//to manso
	if(consumido)
	{
		//o player esta em mim	
		//estado					= estado_parado; //fui feito p
		if(escala)
		{
			//chacando se tem aprede
			var _parede				= place_meeting(x+1, y, obj_block) or place_meeting(x-1, y, obj_block);
			
			if(_parede) estado		= estado_escalar;
		}
	}
	else
	{
		estado					= estado_vazio;
		//o player não esta em mim mais estou manso
	}
	
}
else
{
	//se minha vida for menor ou 0 eu fico manso
	if(vida<=0) manso = true;
	
}

estado();


