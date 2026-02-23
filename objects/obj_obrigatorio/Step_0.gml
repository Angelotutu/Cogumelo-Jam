/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


input();
//fazendo a tela tremer com meu screenshake
view_xport[0] = random_range(-global.shake, global.shake);
view_yport[0] = random_range(-global.shake, global.shake);
//fazend a tela parar de tremer aos poucos
if(global.shake > 0) global.shake -= .1;
if(global.shake <= 0) global.shake = 0;

if(instance_exists(obj_player))
{
	x			= lerp(x, obj_player.x, 0.05);
	y			= lerp(y, obj_player.y-h/4, 0.05);
	camera_set_view_pos(view_camera[0], x-w/2, y-h/2);
}

//camera
//cam_x = lerp(cam_x, lerp_cam_x, 0.08);
//cam_y = lerp(cam_y, lerp_cam_y, 0.08);
//camera_set_view_pos(view_camera[0], cam_x, cam_y);
//limite da camera
//cam_x = clamp(cam_x, 0, camera_get_view_width(view_camera[0])*max_cam_x);
//cam_y = clamp(cam_y, 0, camera_get_view_height(view_camera[0])*max_cam_y);
cam_x = clamp(cam_x, 0, camera_get_view_width(view_camera[0])*max_cam_x);
cam_y = clamp(cam_y, 0, camera_get_view_height(view_camera[0])*max_cam_y);

show_debug_message(cam_x)
//FPS
fps_timer += delta_time;

if (fps_timer >= 250000) // 0.25 segundos
{
    fps_exibido = fps_real;
    fps_timer = 0;
}

if(keyboard_check_pressed(ord("R"))) room_restart();

//fullscreen
if(keyboard_check_pressed(vk_f11)) global.fullscreen = !global.fullscreen;
window_set_fullscreen(global.fullscreen);

