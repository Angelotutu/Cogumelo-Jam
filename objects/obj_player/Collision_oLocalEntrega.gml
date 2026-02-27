/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(instance_exists(oUiEntregas) and global.estaComEntrega)
{
	global.estaComEntrega	= false;
	global.EntregasRealizadas++;
	oUiEntregas.mode		= STATE_MODE.ENTREGOU;
	oUiEntregas.timer		= 4;
	entrega					= true;
}



