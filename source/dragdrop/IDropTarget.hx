package dragdrop;

import flixel.math.FlxRect;

interface IDropTarget
{
	var acceptsTypes:Array<String>;
	var hoverData:Dynamic;

	function accepts(item:IDraggable):Bool;
	function getBounds():FlxRect;
}
