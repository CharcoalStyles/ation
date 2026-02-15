package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class TestSpriteSheetState extends FlxState
{
	var sprites:Array<FlxSprite>;
	var labels:Array<FlxText>;

	var spriteSheetPath:String = "assets/images/colored_packed.png";

	var spriteWidth:Int = 16;
	var spriteHeight:Int = 16;

	var spriteSpacingX:Int = 24;
	var spriteSpacingY:Int = 16;

	override public function create():Void
	{
		super.create();

		var sprite = new FlxSprite().loadGraphic(spriteSheetPath, true, spriteWidth, spriteHeight);
		var totalFrames = sprite.frames.numFrames;

		var text = new FlxText(0, 0, FlxG.width, "Sprite Sheet Test - " + totalFrames + " frames");
		add(text);

		var textHeight = text.height;

    sprites = new Array();

		var spritesStartY = textHeight + spriteSpacingY;

		var numSpritesX = Std.int(FlxG.width / (spriteWidth + spriteSpacingX));
		var numSpritesY = Std.int(FlxG.height / (spriteHeight + spriteSpacingY + textHeight));

		labels = new Array();

		var spritesAdded = 0;

		for (y in 0...numSpritesY)
		{
			for (x in 0...numSpritesX)
			{
				var sprite = new FlxSprite().loadGraphic(spriteSheetPath, true, spriteWidth, spriteHeight);
				sprite.x = x * (spriteWidth + spriteSpacingX);
				sprite.y = spritesStartY + y * (spriteHeight + spriteSpacingY);
				sprite.animation.frameIndex = y * numSpritesX + x;
        sprites.push(sprite);
				add(sprite);
				spritesAdded++;


				var label = new FlxText(sprite.x, sprite.y + spriteHeight, -1, Std.string(y * numSpritesX + x));
				labels.push(label);
				add(label);

				if (spritesAdded >= totalFrames)
				{
					return;
				}
			}
		}
	}
}
