/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//show_debug_message(qtd_pulos);

//parando se for pause
if(global.pause) 
{
	velh = 0;
	velv = 0;
	exit;
}
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

if(pode_esporo)
{
	//cab			= true;
	tp_cab		= dl_cab;
	cab_index	= image_index;
}
else
{
	if(!cab)
	{
		tp_cab++;
		if(tp_cab>=dl_cab)
		{
			cab_index++;
			tp_cab	= 0;
		}
		if(cab_index>=3)
		{
			cab		= true;
			tp_cab	= 0;
		}
		
	}
	
}

//fazendo o efeito de squash squezze
if(face) ld = 1;
else ld = -1;

tamx				= lerp(tamx, image_xscale, squezze);
tamy				= lerp(tamy, image_xscale, squezze);

xscale				= tamx*ld
yscale				= tamy;
