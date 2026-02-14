package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;

class TestSpriteSheetState extends FlxState
{
	var sprites:Array<FlxSprite>;

	var spriteSheetPath:String = "assets/images/colored_packed.png";

	var spriteWidth:Int = 16;
	var spriteHeight:Int = 16;

	var spriteSpacingX:Int = 4;
	var spriteSpacingY:Int = 4;

	var numSpritesX:Int = 20;
	var numSpritesY:Int = 20;

	override public function create():Void
	{
		super.create();

    sprites = new Array();

		// Load from XML atlas (recommended for named frames)
		// var frames = FlxAtlasFrames.fromSparrow("assets/images/spritesheet.xml");

		// Or load from uniform grid (if no XML)
		// sprite = new FlxSprite().loadGraphic("assets/images/colored.png", false, 16,16,);

		for (x in 0...numSpritesX)
		{
			for (y in 0...numSpritesY)
			{
				var sprite = new FlxSprite().loadGraphic(spriteSheetPath, true, spriteWidth, spriteHeight);
				sprite.x = x * (spriteWidth + spriteSpacingX);
				sprite.y = y * (spriteHeight + spriteSpacingY);
        sprites.push(sprite);
				add(sprite);
			}
		}

		newSprites();
	}

  override public function update(elapsed:Float):Void {
    super.update(elapsed);

    if (FlxG.keys.justPressed.SPACE)
    {
      newSprites();
    }
  }

	function newSprites():Void
	{
		for (i in 0...numSpritesX * numSpritesY)
		{
			sprites[i].animation.frameIndex = FlxG.random.int(0, sprites[i].frames.numFrames);
		}
	}
}
