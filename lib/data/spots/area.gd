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

func collide( area : TouchArea ) -> bool : return false
static func Empty() -> TouchArea : return TouchArea.new(0,0,0,0)
