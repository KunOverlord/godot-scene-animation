class_name TouchArea extends Resource

@export var x : int = 0
@export var y : int = 0
@export var width : int = 0
@export var height : int = 0

func _init(x = 0, y = 0 , w =0 , h = 0 ):
	self.x = x
	self.y = y
	self.width = w
	self.height = h

func position() -> Vector2i : return Vector2i(x,y)
func rect() -> Rect2i: return Rect2i(x,y,width,height)
func collide( area : TouchArea ) -> bool : return false
#func collide( x : int = 0 , y : int = 0 ): return false

static func Empty() -> TouchArea : return TouchArea.new(0,0,0,0)
