/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//controlando o player
var _chao = place_meeting(x, y + 1, obj_chao);

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check(inputs.jump);


//so posso me controlar se nao tomei dano está zerado
if (timer_dano <=0)
{
velh = (_right - _left) * vel;
}

//pulando
if (_chao)
{
	if (_jump)
	{
		velv = -vel_jump;
	}
	
	//se eu estou no chão e me movendo
	if (velh != 0)
	{
		//mudo a sprire
		sprite_index = spr_player_run;
		//faso ele olhar para onde eu estou indo
		image_xscale = sign(velh);
	}
	else
	{
		sprite_index = spr_player_idle;
	}
	
}
else //nao estou no chão
{
	//mudando a sprite
	if (velv <0)
	{
		sprite_index = spr_player_jump;
	}
	else
	{
		sprite_index = spr_player_fall;
		
		//se eu estou indo para bainxo, entãp eu posso cair na cabeça do inimigo
		var _inimigo = instance_place(x, y + 5, obj_inimigo_pai);
		
		if (_inimigo)
		{
			dano = false;
			// se o inimigo não está morto
			if (_inimigo.morto == false)
			{
			//subo no ar novamente
			velv = -vel_jump;
			
			//avisando para o inimigo que eu acertei que ele tomou dano
			_inimigo.dano = true;
			}
		}
	}
	//aplicando a gravidade;
	velv += grav;
	if (velh != 0)
	{
	 image_xscale = sign(velh);
	}
}

if (dano)
{
	sprite_index = spr_player_hurt;
}

//sse o timer do dano é maior do que zero, eu diminuo ele
if (timer_dano > 0)
{
	timer_dano--;
}
else
{
	//acabou o timer do dano
	dano = false;
}
if (inv_timer > 0)
{
	inv_timer--;
	
	image_alpha = .5;
}
else
{
	image_alpha = 1;
}

//tomando dano
var _inimigo = instance_place (x, y, obj_inimigo_pai);

if (_inimigo && inv_timer <=0)
{
	if (_inimigo.morto == false && _inimigo.dano == false)
	{
	dano = true;
	// dando o valor do timer dano
	timer_dano	= tempo_dano;
	inv_timer	= inv_tempo;
	}
}

var _col = instance_place(x + velh, y, obj_fim);
if (_col && obj_jogo.key == true) {
	room_goto_next();
} else {
	draw_text(obj_player.posX, obj_player.posY + 50,"Sem chaves...");
}
	
	
