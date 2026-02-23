/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.options)
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

if(musica and save)
{
	if(global.musica	<= .0)b_barra = 225+cam_x;
	if(global.musica	= .1)b_barra = 235+cam_x;
	if(global.musica	= .2)b_barra = 240+cam_x;
	if(global.musica	= .3)b_barra = 245+cam_x;
	if(global.musica	= .4)b_barra = 250+cam_x;
	if(global.musica	= .5)b_barra = 255+cam_x;
	if(global.musica	= .6)b_barra = 260+cam_x;
	if(global.musica	= .7)b_barra = 265+cam_x;
	if(global.musica	= .8)b_barra = 270+cam_x;
	if(global.musica	= .9)b_barra = 275+cam_x;
	if(global.musica	>= 1) b_barra = 280+cam_x;
	save				= false;
}
if(sons and save)
{
	if(global.som	<= .0)b_barra = 225+cam_x;
	if(global.som	= .1)b_barra = 235+cam_x;
	if(global.som	= .2)b_barra = 240+cam_x;
	if(global.som	= .3)b_barra = 245+cam_x;
	if(global.som	= .4)b_barra = 250+cam_x;
	if(global.som	= .5)b_barra = 255+cam_x;
	if(global.som	= .6)b_barra = 260+cam_x;
	if(global.som	= .7)b_barra = 265+cam_x;
	if(global.som	= .8)b_barra = 270+cam_x;
	if(global.som	= .9)b_barra = 275+cam_x;
	if(global.som	>= 1) b_barra = 280+cam_x;
	save				= false;
}

if(instance_exists(obj_obrigatorio))
{
	var _ob		= obj_obrigatorio;
	cam_x		= _ob.cam_x;
	cam_y		= _ob.cam_y;
	
}


if(voltar)
{
	image_xscale	= 2;
	image_yscale	= 2;
	x				= cam_x+512/2.6-20;
	y				= cam_y+288/4.8;
	botaov			= 1
	if(global.botaov < 1) global.botaov = botaov;
	cube_x			= 20;
}
if(musica)
{
	image_xscale	= 11;
	image_yscale	= 3;
	x				= cam_x+512/2;
	y				= cam_y+288/2.7+16;
	botaov			= 2;
	if(global.idioma) cube_x = 30;
	else cube_x			= 25;
	//show_message(b_barra);
	if(b_barra <= 230+cam_x) global.musica	= .0;
	if(b_barra = 235+cam_x) global.musica		= .1;
	if(b_barra = 240+cam_x) global.musica		= .2;
	if(b_barra = 245+cam_x) global.musica		= .3;
	if(b_barra = 250+cam_x) global.musica		= .4;
	if(b_barra = 255+cam_x) global.musica		= .5;
	if(b_barra = 260+cam_x) global.musica		= .6;
	if(b_barra = 265+cam_x) global.musica		= .7;
	if(b_barra = 270+cam_x) global.musica		= .8;
	if(b_barra = 275+cam_x) global.musica		= .9;
	if(b_barra >= 280+cam_x) global.musica	= 1;

}
if(sons)
{
	image_xscale	= 11;
	image_yscale	= 3;
	x				= cam_x+512/2;
	y				= cam_y+288/1.7+16;
	botaov			= 3;
	if(global.idioma) cube_x = 30;
	else cube_x			= 35;
	if(b_barra <= 230+cam_x) global.som	= .0;
	if(b_barra = 235+cam_x) global.som	= .1;
	if(b_barra = 240+cam_x) global.som	= .2;
	if(b_barra = 245+cam_x) global.som	= .3;
	if(b_barra = 250+cam_x) global.som	= .4;
	if(b_barra = 255+cam_x) global.som	= .5;
	if(b_barra = 260+cam_x) global.som	= .6;
	if(b_barra = 265+cam_x) global.som	= .7;
	if(b_barra = 270+cam_x) global.som	= .8;
	if(b_barra = 275+cam_x) global.som	= .9;
	if(b_barra >= 280+cam_x) global.som	= 1;
}
if(screen)
{
	image_xscale	= 18;
	x				= cam_x+512/2;
	y				= cam_y+288/1.2;
	cube_x			= 40;
	botaov			= 4
	if(global.botaov > 4) global.botaov = botaov;
}


if(musica) //show_debug_message(b_barra);

if(global.options)
{
	image_alpha = 1;
}
else
{
	image_alpha	= 0;
	exit;
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
	if(tp>dl and global.left and b_barra>225+cam_x){b_barra-=5;  tp = 0;}
	if(tp>dl and global.right and b_barra<285+cam_x){b_barra+=5; tp = 0;}
}
//se eu to clicado no som
if(sons and ativo)
{
	//deixando o botao so aq
	global.botaoh = botaoh;
	//Mudando o som
	//if(global.left and global.som>0)global.som-=.1;
	//if(global.right and global.som<1)global.som+=.1;
	if(tp>dl and global.left and b_barra>225+cam_x){b_barra-=5;  tp = 0;}
	if(tp>dl and global.right and b_barra<285+cam_x){b_barra+=5; tp = 0;}
	
}

