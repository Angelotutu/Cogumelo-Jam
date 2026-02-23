/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(xx>0 and vindo)xx-=vel_vindo;
if(xx <= 0 and vindo)
{
	if(restart) room_restart();
	else room_goto(essa_room);
	tp_escuro++;
	if(tp_escuro >= dl_escuro) vindo = false;
}
if(xx>-630 and !vindo)xx-=vel_saindo;
if(xx<=-630) instance_destroy();


