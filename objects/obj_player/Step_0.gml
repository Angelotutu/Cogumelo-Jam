/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//show_debug_message(qtd_pulos);

//parando se for pause
if(global.pause) exit;
estado();

//esporo
tp_e++;

if(ativo_esporo)
{
	//garantido que o delay de volta seja 0;
	tp_ec = 0;
	esporo();
}
//se minha quantidade de esporos for negativa
if(qtd_esporo <= 0)
{
	//não pego o parry
	ativo_esporo					= false;
	pode_esporo						= false;
	tp_ec++;
	if(tp_ec >= dl_ec)
	{
		qtd_esporo	= 3;
		pode_esporo = true;
		
	}
	
}
