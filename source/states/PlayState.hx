package states;

import entities.Player;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player:Player;

	override public function create()
	{
		super.create();
		player = new Player(100, 100);
		add(player);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
