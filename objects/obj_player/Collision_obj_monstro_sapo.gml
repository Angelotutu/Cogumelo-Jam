/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause) exit;
//vendo se o monstro ta manso e se soltei esporos
if(other.manso and ativo_esporo)
{
	other.consumido	= true;
	other.estado	= other.estado_parado;
	estado			= estado_consumidor;
	
	
	
}
else if(other.manso)//se 
{
	if(image_alpha) other.consumido		= false;
	
}

//vendo se o monstro ta manso
if(other.manso and estado = estado_consumidor)
{
	x					= other.x;
	y					= other.y;
	
	
}


