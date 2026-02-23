/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

xx				= 600;
yy				= 0;
cor				= c_black;
dl_escuro		= 60;
tp_escuro		= 0;
vindo			= true;
vel_saindo		= 15;
vel_vindo		= 15;
restart			= false;


cam_x			= 0;
cam_y			= 0;

if(instance_exists(obj_obrigatorio))
{
	cam_x = obj_obrigatorio.cam_x;
	cam_y = obj_obrigatorio.cam_y;
}
