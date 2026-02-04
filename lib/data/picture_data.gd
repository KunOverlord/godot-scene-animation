class_name PictureData extends Resource

@export var name : String = ""
@export_file("*.png", "*.jpg", "*.jpeg", "*.webp") var bitmap: String
@export var tags : Array[String] = []

func picture_name() -> String : return name if name.length() else bitmap
func picture_tags() -> Array[String] : return tags
func texture() -> Texture2D:
	if bitmap.is_empty(): return null
	return load(bitmap)
