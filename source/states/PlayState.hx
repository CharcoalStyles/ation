package states;

import entities.Player;
import flixel.FlxState;
import utils.GlobalState;

class PlayState extends FlxState
{
	var player:Player;
	var globalState:GlobalState;

	override public function create()
	{
		super.create();
		player = new Player(100, 100);
		add(player);

		globalState = GlobalState.instance;
		add(globalState.projectiles);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
