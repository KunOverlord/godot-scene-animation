class_name HotSpot extends Resource


@export var name : String = "hotspot"
@export var area: TouchArea = TouchArea.new()


func touch(x,y) -> bool :
	return area.collide(x,y)
