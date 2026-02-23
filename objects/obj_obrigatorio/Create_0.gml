/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//variaveis para a camera
cam_x				= 0;
cam_y				= 0;
lerp_cam_x			= 0;
lerp_cam_y			= 0;
max_cam_x			= 100;
max_cam_y			= 100;
//variaveis pro FPS
fps_timer			= 0;
fps_exibido			= 0;

//desetando coisas
global.pause	= false;
global.menu		= true;
global.options	= false;
global.botaoh	= 0;
global.botaov	= 0;

w=camera_get_view_width(view_camera[0]);
h=camera_get_view_height(view_camera[0]);

//caso não exista as opçoes eu crio
if not(instance_exists(obj_options))
{
	instance_create_layer(x, y, "Options", obj_options);
}

