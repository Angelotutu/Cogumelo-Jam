/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause) exit;
if(manso)
{
	
	exit;
}

//se eu soltei o esporo
if(other.ativo_esporo)
{
	screenshake(2);
	//paro o ataque e tomo dano
	//sem attack por enquanto;
	if(other.x >= x) face = 1;
	else face				= 0;
	
	if(face) velh			= -3;
	else velh				= 3;
	velv					= -3;
	estado					= estado_trombada;
	exit;
	
}
if(x >= other.x) other.face = 1;
else other.face				= 0;

if(other.face) other.velh	= -5;
else other.velh				= 5;
other.velv					= -5;
other.estado				= other.estado_trombada;
screenshake(2);

