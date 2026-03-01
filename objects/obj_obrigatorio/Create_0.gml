/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//cancelando os sons
audio_stop_all();

//orquestra
msc_speed			= audio_play_sound(Speed_Music_entregador_congumelo, 1, 1);
msc_m1				= audio_play_sound(musica_Entregador_cogumelo_sla, 1, 1);
msc_m2				= audio_play_sound(Music_Water_Entregador_cogumelo, 1, 1);
msc_m3				= audio_play_sound(Music_missao3_temporaria, 1, 1);
audio_sound_gain(msc_speed, 0, 0);
audio_sound_gain(msc_m1, 0, 0);
audio_sound_gain(msc_m2, 0, 0);
audio_sound_gain(msc_m3, 0, 0);
//variaveis para a camera
cam_x				= 0;
cam_y				= 0;
//lerp_cam_x			= 0;
//lerp_cam_y			= 0;
//max_cam_x			= 100;
//max_cam_y			= 100;
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

