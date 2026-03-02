package dragdrop;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class DragManager extends FlxBasic
{
	public static var instance:DragManager;

	public var draggables:Array<Draggable>;
	public var targets:Array<DropTarget>;
	public var events:DragEvents;

	private var activeDrag:Draggable = null;
	private var activePointerId:Int = -1;
	private var dragOffset:FlxPoint = new FlxPoint();
	private var hoveredTarget:Null<DropTarget> = null;

	public function new()
	{
		super();
		instance = this;
		draggables = [];
		targets = [];
		events = new DragEvents();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (activeDrag == null)
		{
			checkForDragStart();
		}
		else
		{
			if (activePointerId >= 0 && FlxG.mouse.justReleased)
			{
				endDrag();
			}
			else
			{
				updateDrag();
			}
		}
	}

	function checkForDragStart()
	{
		if (FlxG.mouse.justPressed)
		{
			var mousePos = FlxG.mouse.getPosition();
			
			for (draggable in draggables)
			{
				if (Std.isOfType(draggable, FlxSprite))
				{
					var sprite = cast(draggable, FlxSprite);
					if (sprite.isOnScreen() && sprite.visible)
					{
						var bounds = new flixel.math.FlxRect(sprite.x, sprite.y, sprite.width, sprite.height);
						if (bounds.containsPoint(mousePos))
						{
							startDrag(draggable, 0, mousePos);
							return;
						}
					}
				}
			}
		}
	}

	function startDrag(draggable:Draggable, pointerId:Int, mousePos:FlxPoint)
	{
		activeDrag = draggable;
		activePointerId = pointerId;

		if (Std.isOfType(draggable, FlxSprite))
		{
			var sprite = cast(draggable, FlxSprite);
			dragOffset.set(mousePos.x - sprite.x, mousePos.y - sprite.y);
		}

		draggable.startDrag(pointerId);

		if (events.onDragStart != null)
			events.onDragStart(draggable, pointerId);
	}

	function updateDrag()
	{
		if (activeDrag == null)
			return;

		var mousePos = FlxG.mouse.getPosition();
		var x = mousePos.x - dragOffset.x;
		var y = mousePos.y - dragOffset.y;

		if (Std.isOfType(activeDrag, FlxSprite))
		{
			var sprite = cast(activeDrag, FlxSprite);
			sprite.x = x;
			sprite.y = y;
		}

		activeDrag.updateDrag(activePointerId, x, y);

		if (events.onDragMove != null)
			events.onDragMove(activeDrag, activePointerId, x, y);

		checkHoverTarget();
	}

	function checkHoverTarget()
	{
		var newHovered:Null<DropTarget> = null;

		if (Std.isOfType(activeDrag, FlxSprite))
		{
			var sprite = cast(activeDrag, FlxSprite);
			var center = new FlxPoint(sprite.x + sprite.width / 2, sprite.y + sprite.height / 2);

			for (target in targets)
			{
				if (target.accepts(activeDrag) && target.getBounds().containsPoint(center))
				{
					newHovered = target;
					break;
				}
			}
		}

		if (newHovered != hoveredTarget)
		{
			if (hoveredTarget != null && events.onHoverOut != null)
				events.onHoverOut(activeDrag, hoveredTarget);

			hoveredTarget = newHovered;

			if (hoveredTarget != null && events.onHover != null)
				events.onHover(activeDrag, hoveredTarget);
		}
	}

	function endDrag()
	{
		if (activeDrag == null)
			return;

		var droppedOn = hoveredTarget;

		activeDrag.endDrag(activePointerId, droppedOn);

		if (events.onDragEnd != null)
			events.onDragEnd(activeDrag, activePointerId, droppedOn);

		if (droppedOn != null && events.onDrop != null)
			events.onDrop(activeDrag, droppedOn);

		if (hoveredTarget != null && events.onHoverOut != null)
			events.onHoverOut(activeDrag, hoveredTarget);

		activeDrag = null;
		activePointerId = -1;
		hoveredTarget = null;
	}

	public function register(draggable:Draggable)
	{
		if (!draggables.contains(draggable))
			draggables.push(draggable);
	}

	public function unregister(draggable:Draggable)
	{
		draggables.remove(draggable);
	}

	public function addTarget(target:DropTarget)
	{
		if (!targets.contains(target))
			targets.push(target);
	}

	public function removeTarget(target:DropTarget)
	{
		targets.remove(target);
	}
}
