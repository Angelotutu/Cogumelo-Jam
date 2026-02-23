/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(global.menu)
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

if(mouse_check_button_pressed(mb_left)) cliquei = true;
else cliquei = false;

//se to ativo
if(ativo)
{
	//coloco visualmente que estou ativo
	cor = cor_ativo;
	tam	= lerp(tam, tam_ativo, 0.1);
	//quando eu clicar no botao
	if(global.confirmar or cliquei and cursor)
	{
		global.idioma = idioma;
	}
}
else //se não
{
	//coloco visualmente que não estou ativo	
	cor = cor_normal;
	tam	= lerp(tam, tam_normal, 0.1);
}
