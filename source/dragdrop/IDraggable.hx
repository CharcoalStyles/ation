package dragdrop;

import flixel.math.FlxPoint;

interface IDraggable
{
	var originalPosition(get, set):FlxPoint;
	var isDragging(get, never):Bool;
	var dragData(get, set):Dynamic;

	function startDrag(pointerId:Int):Void;
	function updateDrag(pointerId:Int, x:Float, y:Float):Void;
	function endDrag(pointerId:Int, droppedOn:Null<IDropTarget>):Void;
}
