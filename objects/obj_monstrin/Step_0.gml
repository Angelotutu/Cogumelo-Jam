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
	estado = morte;
}
else
{
	//se minha vida for menor ou 0 eu fico manso
	if(vida<=0) manso = true;
	
}

estado();


