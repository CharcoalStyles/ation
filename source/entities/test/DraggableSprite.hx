package entities.test;

import dragdrop.Draggable;
import dragdrop.DropTarget;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class DraggableSprite extends FlxSprite implements Draggable
{
	private var _originalPosition:FlxPoint = new FlxPoint();
	public var originalPosition(get, set):FlxPoint;

	private var _isDragging:Bool = false;
	public var isDragging(get, never):Bool;

	private var _dragData:Dynamic;
	public var dragData(get, set):Dynamic;

	private function get_originalPosition():FlxPoint return _originalPosition;
	private function set_originalPosition(value:FlxPoint):FlxPoint { _originalPosition = value; return value; }

	private function get_isDragging():Bool return _isDragging;
	private function get_dragData():Dynamic return _dragData;
	private function set_dragData(value:Dynamic):Dynamic { _dragData = value; return value; }

	public function new(?X:Float, ?Y:Float, ?Graphic)
	{
		super(X, Y, Graphic);
		_originalPosition.set(X, Y);
	}

	public function startDrag(pointerId:Int):Void
	{
		_isDragging = true;
		_originalPosition.set(x, y);
	}

	public function updateDrag(pointerId:Int, x:Float, y:Float):Void
	{
		// Override in subclass for custom behavior during drag
	}

	public function endDrag(pointerId:Int, droppedOn:Null<DropTarget>):Void
	{
		_isDragging = false;
		
		if (droppedOn == null)
		{
			// Snap back to original position
			x = _originalPosition.x;
			y = _originalPosition.y;
		} else {
      
      x = droppedOn.x + (droppedOn.width - width) / 2;
      y = droppedOn.y + (droppedOn.height - height) / 2;
    }
	}
}
