/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velh = 0;
velv = 0;
vel = 4;
grav = .3;
vel_jump = 7;
key = false;
posX = obj_player.x;
posY = obj_player.y;

dano = false;
tempo_dano = room_speed * 1;
timer_dano = 0;

inv_tempo = room_speed * 2;
inv_timer = 0;

inputs = {
		left : ord("A"),
		right : ord ("D"),
		jump : vk_space
}
