/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (morto)
{
	sprite_index = spr_new_inimigo_slime_dead;
	
	//sumindo se acabou a minha animação
	if (image_speed <=0)
	{
		image_alpha -= 0.01;
	}
	//se eu sumir totalmente, eu me destrue
	if (image_alpha <=0)
	{
		instance_destroy();
	}
	exit;
}

//chegando se o slime está no chão
var _chao = place_meeting(x,y + 1, obj_chao);

if (_chao)
{
	//vou diminuir o tempo de decidir andar
	tempo_decidir_andar -= 1;
	
	//se o tempo acabou, eu decido se vou andar
	if (tempo_decidir_andar <=0)
	{
		andando = choose(true, false);
		
		//escolhendo a direção se ele decidiu andar
		if (andando)
		{
		velh = choose( vel, -vel);
		}
		else
		{
			velh = 0;
		}
		
		//resentando o tempo
		tempo_decidir_andar = room_speed * 3;
	}
	
	//controlando a animação do inimigo
	if (velh != 0 && dano == false)
	{
		sprite_index = spr_new_inimigo_slime_run;
		image_xscale = sign(velh);
	}
	else
	{
		sprite_index = spr_new_inimigo_slime_idle;
	}
	
	//se eu bater na parede, eu mudo de direção
	if (place_meeting(x + velh, y, obj_chao))
	{
		velh *= -1;
	}
	
	//se eu nao poder cair, então quando eu cair eu mudo de direçãp
	if (pode_cair == false)
	{
		if (place_meeting(x + (velh * 10), y + 1, obj_chao) == false)
		{
		//se eu nao posso car e nao estou tocando no chão na minha frente
		//entao eu mudo de direção
		velh *= -1;
		}
	}
	
}
else
{	//se eu não estou no chão, eu aplico a gravidade
 velv += grav;
 
 //velh = 0;
 
 if (velh !=0)
 {
	image_xscale = sign(velh);
 }
}

//chegando se eu estou tomando dano
if (dano && morto == false)
{
	sprite_index = spr_new_inimigo_slime_hurt;
	velh =0;
}
