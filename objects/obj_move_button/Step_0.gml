/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//se existe o objeto transicao não me mexo
if(instance_exists(obj_transicao)) exit;

tp++;
if(tp<dl)exit;
if(global.left)
{
	if(global.botaoh == 0) global.botaoh = max_h;
	else global.botaoh--;
	tp = 0;
}
if(global.right)
{
	if(global.botaoh == max_h) global.botaoh = 0;
	else global.botaoh++;
	tp = 0;
}
if(global.up)
{
	if(global.botaov == 0) global.botaov = max_v;
	else global.botaov--;
	tp = 0;
}
if(global.down)
{
	if(global.botaov == max_v) global.botaov = 0;
	else global.botaov++;
	tp = 0;
}



