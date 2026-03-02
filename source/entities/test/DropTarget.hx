package entities.test;

import dragdrop.IDraggable;
import dragdrop.IDropTarget;
import flixel.FlxSprite;
import flixel.math.FlxRect;

class DropTarget extends FlxSprite implements IDropTarget
{
	public var acceptsTypes:Array<String>;
	public var hoverData:Dynamic;

	public function new(X:Float = 0, Y:Float = 0, ?graphic, ?types:Array<String>)
	{
		super(X, Y, graphic);
		acceptsTypes = types != null ? types : [];
	}

	public function accepts(item:IDraggable):Bool
	{
		if (acceptsTypes.length == 0)
			return true;

		var itemType = Type.getClassName(Type.getClass(item));
		return acceptsTypes.contains(itemType);
	}

	public function getBounds():FlxRect
	{
		return getHitbox();
	}
}
