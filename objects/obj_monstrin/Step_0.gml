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
	if not(consumido)
	{
		estado = estado_vazio;
	}
	
}
else
{
	//se minha vida for menor ou 0 eu fico manso
	if(vida<=0)
	{
		estado = estado_parado;
		manso = true;
	}
	
}

estado();


