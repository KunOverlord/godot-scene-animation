class_name PictureData extends Resource

@export var name : String = ""
@export_file("*.png", "*.jpg", "*.jpeg", "*.webp") var picture: String
@export var position : Vector2i = Vector2i.ZERO
@export var scale : Vector2 = Vector2.ONE

var _buffer : Texture2D = null;

func _init(): pass

func alias() -> String : return name if name.length() else picture

func texture() -> Texture2D:
	if !picture.is_empty(): _buffer = load(picture)
	return _buffer

func size( ) -> Vector2i:
	var t = texture()
	return Vector2i(
		t.get_width(),
		t.get_height()
	) if t else Vector2i.ZERO


	
