/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



// Inherit the parent event
event_inherited();

//personalizando as variaveis
//ele vai decidir se pode andar para a direita ou para esquerda
vel = choose( 1, -1);

andando = choose(true, false)

if (andando)
	{
		velh = choose( vel, -vel);
	}
	else
	{
		velh = 0;
	}

tempo_decidir_andar = room_speed *3;

