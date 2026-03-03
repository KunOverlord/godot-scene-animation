class_name SkinData extends Resource

@export_file("*.png", "*.jpg", "*.jpeg", "*.webp") var bitmap: String
@export var tags : Array[String] = []

func _init() -> void: pass

func itsme( name : String = "") -> bool:
	return name.length() and name == bitmap

func has( tag : String = "" ) -> bool :
	for t in tags: if t == tag : return true
	return false
