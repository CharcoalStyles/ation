package states;

import csHxUtils.entities.SplitText;
import flixel.FlxState;

class PlayState extends FlxState
{
	var gameName:String = "Ation";

	override public function create()
	{
		super.create();

		var text = new SplitText(0, 0, gameName, SplitText.naiieveScaleDefaultOptions(2.5));

		text.animateWave(5, 0.1, 1.5, false);
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
