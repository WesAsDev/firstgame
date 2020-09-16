
esquerda = keyboard_check(vk_left); // enquanto eu n aperto tem o valor de 0, se eu aperto tem o valor de 1
direita = keyboard_check(vk_right); // enquanto eu n aperto tem o valor de 0, se eu aperto tem o valor de 1
pulo = keyboard_check(vk_up); // enquanto eu n aperto tem o valor de 0, se eu aperto tem o valor de 1

var move = direita - esquerda; //se eu aperto pra direita vai ser (1-0 = 1) se apertar esquerda vai ser (0-1 = -1), pq esquerda é X positivo e direita é X negativo

velh = move * vel; // multiplica o valor de 1 ou -1 com a velocidade, se a velocidade por ex for 4 e eu apertar para a esquerda vai ficar -4

velv = velv + grv; // Multiplicao valor de Y pelo valor da gravidade


if (place_meeting(x,y+1,oParede)) && (pulo) // se o player estiver no chão e pressionar o botão de pulo
{
	velv = -7;  //velocidade vertical = -7 (y pra cima)
	
}


//colisão horizontal
if (place_meeting(x+velh,y,oParede)) //SE o objeto estiver no pixel X então...
{
	while (!place_meeting(x+sign(velh),y,oParede)) //enquanto o objeto NÃO (!) estiver encostando no pixel 1 ou -1 do eixo x
	{
		x = x + sign(velh);	// o x vai ser = à x + 1 ou -1, SIGN retorna apenas o negativo ou positivo da variavel dentro dele
	}
	velh = 0;
}
x = x + velh;

//colisão vertical
if (place_meeting(x,y+velv,oParede)) //SE o objeto estiver no pixel Y então...
{
	while (!place_meeting(x,y+sign(velv),oParede)) //enquanto o objeto NÃO (!) estiver encostando no pixel 1 ou -1 do eixo Y
	{
		y = y + sign(velv);	// o Y vai ser = à Y + 1 ou -1, SIGN retorna apenas o negativo ou positivo da variavel dentro dele
	}
	velv = 0;
}
y = y + velv;


//animação

if (!place_meeting(x,y+1,oParede))
{
	sprite_index = sPlayerJ; //sprite index busca a sprite no arquivo
	image_speed = 0; //image speed é avelocidade que o sprite vai ser executado caso haja animação
	if (sign(velv) < 0) image_index = 1; else image_index = 2

}

else
{
	image_speed = 1;
	if (velh == 0) //Dois iguais é pra questionar o programa, um igual é pra setar
	{
		sprite_index = sPlayerI;
		image_speed = 0.5
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

if (velh != 0) image_xscale = sign(velh)*2;