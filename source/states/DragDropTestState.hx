package states;

import dragdrop.DragManager;
import entities.test.DraggableSprite;
import entities.test.DropTarget;
import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.text.FlxText;

class DragDropTestState extends FlxState
{
	var dragManager:DragManager;

	override public function create()
	{
		super.create();

		dragManager = new DragManager();
		add(dragManager);

		for (i in 0...10)
		{
			// Create drop targets
			var target = new DropTarget(150 + i * 100, 150, null, ["entities.test.DraggableSprite"]);
			target.makeGraphic(80, 80, 0x88444444);
			add(target);
			dragManager.addTarget(target);
		}

		// Create some draggable items
		var item1 = new DraggableSprite(100, 200);
		item1.makeGraphic(64, 64, 0xff4488ff);
		add(item1);
		dragManager.register(item1);

		var item2 = new DraggableSprite(200, 200);
		item2.makeGraphic(64, 64, 0xff44ff88);
		add(item2);
		dragManager.register(item2);

		// Instructions
		var text = new FlxText(10, 10, 0, "Drag the colored squares to the gray targets");
		add(text);

		// Set up events
		dragManager.events.onDragStart = function(draggable, pointer)
		{
			FlxG.log.add("Drag started!");
		};

		dragManager.events.onDrop = function(draggable, target)
		{
			FlxG.log.add("Dropped on target!");
		};

		dragManager.events.onDragEnd = function(draggable, pointer, droppedOn)
		{
			if (droppedOn == null)
			{
				FlxG.log.add("Returned to original position");
			}
		};
	}
}
