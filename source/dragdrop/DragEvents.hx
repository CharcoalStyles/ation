package dragdrop;

typedef DragStartCallback = (Draggable, Int) -> Void;
typedef DragMoveCallback = (Draggable, Int, Float, Float) -> Void;
typedef DragEndCallback = (Draggable, Int, Null<DropTarget>) -> Void;
typedef DropCallback = (Draggable, DropTarget) -> Void;
typedef HoverCallback = (Draggable, DropTarget) -> Void;

class DragEvents
{
	public var onDragStart:DragStartCallback;
	public var onDragMove:DragMoveCallback;
	public var onDragEnd:DragEndCallback;
	public var onDrop:DropCallback;
	public var onHover:HoverCallback;
	public var onHoverOut:HoverCallback;

	public function new() {}
}
