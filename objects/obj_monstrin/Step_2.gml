/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//Fazendo o sistema de colisão e movimentação Horizontal.
repeat(abs(velh))
{
	var _velh	= sign(velh);
	//subindo rampa
	//se eu to colidiondo com algo a minhan frente e em cima nada
	if(place_meeting(x + _velh, y, obj_block)) &&
		!place_meeting(x + _velh, y - 1, obj_block)
	{
		y--;
	}
	//desendo rampa
	if(!place_meeting(x + _velh, y, obj_block) &&
		!place_meeting(x + _velh, y +1, obj_block) &&
		place_meeting(x + _velh, y + 2, obj_block))
	{
		y++;
	}
	//Se to colidindo com a parede
	if(place_meeting(x + _velh, y, obj_block))
	{
		//Eu paro
		velh = 0;
		//Saindo do laço
		break;
		
	}
	else// se eu não colidi com a parede
	{
		//eu me movo
		x += _velh;
	}
	
}

//Colisão vertical
repeat(abs(velv))
{
	
	var _velv = sign(velv);
	
	//Se eu to colidindo com o chao
	if(place_meeting(x, y + _velv, obj_block))
	{
		//Eu paro
		velv = 0;
		//Saio do laço
		break;
	}
	else//se eu não colidi
	{
		//posso me mover na vertical
		y += _velv;
	}
	
}
