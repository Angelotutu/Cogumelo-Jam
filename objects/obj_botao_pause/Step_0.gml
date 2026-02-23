/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.pause and !global.options)
{
	image_alpha = 1;
}
else
{
	image_alpha	= 0;
	exit;
}
//pegando o tamanho da cena

tp++;
if(instance_exists(obj_obrigatorio))
{
	var _ob		= obj_obrigatorio;
	cam_x		= _ob.cam_x;
	cam_y		= _ob.cam_y;
	
}


if(retornar)
{
	image_xscale	= 4;
	image_yscale	= 2;
	x				= cam_x+512/2
	y				= cam_y+288/2.35;
	botaov			= 1
	if(global.botaov < 1) global.botaov = botaov;
	cube_x			= 15;
	txt				= string(global.text[global.idioma][14]);
	if(global.confirmar and global.botaov == botaov) global.pause = !global.pause;
}
if(reiniciar)
{
	image_xscale	= 4;
	image_yscale	= 2;
	x				= cam_x+512/2;
	y				= cam_y+288/1.97;
	botaov			= 2;
	cube_x			= 15;
	txt				= string(global.text[global.idioma][15]);
	if(global.confirmar and global.botaov == botaov and trans)
	{
		//crio a transicao
		var _trans			= instance_create_layer(0, 0, "Transicao", obj_transicao);
		_trans.restart		= true;
		_trans.vel_vindo	= 20;
		_trans.rm_vel_indo	= 20;
		_trans.dl_escuro	= 30;
		_trans.cor			= c_black;
		trans				= false;
	}

}
if(options)
{
	image_xscale	= 4;
	image_yscale	= 2;
	x				= cam_x+512/2;
	y				= cam_y+288/1.7;
	botaov			= 3;
	cube_x			= 15;
	txt				= string(global.text[global.idioma][16]);
	if(global.confirmar and global.botaov == botaov)
	{
		if(instance_exists(obj_options))obj_options.ativo = true;
		//global.options	= true;
		//show_message("s");
	}
	
}
if(menu)
{
	image_xscale	= 18;
	x				= cam_x+512/2;
	y				= cam_y+288/1.5;
	cube_x			= 15;
	botaov			= 4
	if(global.botaov > 4) global.botaov = botaov;
	txt				= string(global.text[global.idioma][17]);
	if(global.confirmar and global.botaov == botaov and trans)
	{
		//crio a transicao
		var _trans			= instance_create_layer(0, 0, "Transicao", obj_transicao);
		_trans.essa_room	= rm_menu;
		_trans.vel_vindo	= 20;
		_trans.rm_vel_indo	= 20;
		_trans.dl_escuro	= 30;
		_trans.cor			= c_black;
		trans				= false;
	}
	
}


//se meu botão h e v forem iguais o h e v do global fico ativo
if(botaoh == global.botaoh and botaov == global.botaov) ativo = true;
else ativo = false; //se não fico false

if(cursor and mouse_check_button(mb_left) and (musica or sons) and ativo)
{
	b_barra = mouse_x;
}
else
{
	
	b_barra = round((b_barra - 230) / 5) * 5 + 230;
	
}

b_barra = clamp(b_barra, 225, 285);

if(mouse_check_button_pressed(mb_left)) cliquei = true;
else cliquei = false;

//se to ativo
if(ativo)
{
	//coloco visualmente que estou ativo
	cor = cor_ativo;
	tam	= lerp(tam, tam_ativo, 0.1);
	//quando eu clicar no botao
	if(global.confirmar or cliquei and cursor and pode)
	{
		
		//fullscrean
		if(screen)	global.fullscreen	= !global.fullscreen;
		//voltar
		if(voltar and instance_exists(obj_options))
		{
			obj_options.ativo	= false;
		}
		

		
		
	}
}
else //se não
{
	//coloco visualmente que não estou ativo	
	cor = cor_normal;
	tam	= lerp(tam, tam_normal, 0.1);
}

//se eu to clicado na musica
if(musica and ativo)
{
	//deixando o botao so aq
	global.botaoh = botaoh;
	//Mudando a musica
	//if(global.left and global.musica>0)global.musica-=.1;
	//if(global.right and global.musica<1)global.musica+=.1;
	if(tp>dl and global.left and b_barra>225){b_barra-=5;  tp = 0;}
	if(tp>dl and global.right and b_barra<285){b_barra+=5; tp = 0;}
}
//se eu to clicado no som
if(sons and ativo)
{
	//deixando o botao so aq
	global.botaoh = botaoh;
	//Mudando o som
	//if(global.left and global.som>0)global.som-=.1;
	//if(global.right and global.som<1)global.som+=.1;
	if(tp>dl and global.left and b_barra>225){b_barra-=5;  tp = 0;}
	if(tp>dl and global.right and b_barra<285){b_barra+=5; tp = 0;}
	
}

