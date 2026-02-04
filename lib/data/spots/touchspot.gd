class_name TouchSpot extends HotSpot

@export var next : Array[String] = []
@export var sound : Array[String] = []


#func _init(): pass

func getnext() -> String : return next[ randi() % next.size() ] if next.size() else ""
func getsound() -> String : return sound[ randi() % sound.size() ] if sound.size() else ""
