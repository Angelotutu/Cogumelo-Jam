/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//pegando o tamanho da cena
if(instance_exists(obj_obrigatorio))
{
	var _ob		= obj_obrigatorio;
	cam_x		= _ob.cam_x;
	cam_y		= _ob.cam_y;
	
}

if(ativo)
{
	global.options = true;
	if(global.voltar) ativo = false;
}
else
{
	global.menu		= true;
	global.options	= false;
	if(instance_exists(_musica))_musica.save = true;
	if(instance_exists(_sons))_sons.save = true;
}
