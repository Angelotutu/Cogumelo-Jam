/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause)
{
	velh = 0;
	velv = 0;
	exit;
}

if(face)xscale=1;
else	xscale=-1;

if(manso)
{
	esporos();
	if(consumido)
	{
		idle							= sapo_idle_consumido;
		jump							= sapo_jump_consumido;
		troca_subir						= sapo_begin_jump_consumido;
		subindo							= sapo_up_jump_consumido;
		troca_cair						= sapo_begin_fall_consumido;
		caindo							= sapo_falling_consumido;
		
	}
	else
	{
		idle							= sapo_idle;
		jump							= sapo_jump;
		troca_subir						= sapo_begin_jump;
		subindo							= sapo_up_jump;
		troca_cair						= sapo_begin_fall;
		caindo							= sapo_falling;
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
	idle							= sapo_idle;
	jump							= sapo_jump;
	troca_subir						= sapo_begin_jump;
	subindo							= sapo_up_jump;
	troca_cair						= sapo_begin_fall;
	caindo							= sapo_falling;
	
}

estado();


