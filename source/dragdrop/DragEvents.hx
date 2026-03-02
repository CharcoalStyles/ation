package dragdrop;

typedef DragStartCallback = (IDraggable, Int) -> Void;
typedef DragMoveCallback = (IDraggable, Int, Float, Float) -> Void;
typedef DragEndCallback = (IDraggable, Int, Null<IDropTarget>) -> Void;
typedef DropCallback = (IDraggable, IDropTarget) -> Void;
typedef HoverCallback = (IDraggable, IDropTarget) -> Void;

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
