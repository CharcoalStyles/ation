package states;

import csHxUtils.entities.SplitText;
import flixel.FlxG;
import flixel.FlxState;

class MenuState extends FlxState
{
	var gameName:String = "Ation";

	override public function create()
	{
		super.create();

		var text = new SplitText(0, 0, gameName, SplitText.naiieveScaleDefaultOptions(2.5));
		text.color = 0xff000000;
		text.borderColor = 0xffffffff;
		text.borderQuality = 4;
		text.borderSize = 4;
		text.borderStyle = OUTLINE;
		text.animateWave(5, 0.1, 1.5, false);
		text.x = (FlxG.width - text.width) / 2;
		text.y = 96;
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
