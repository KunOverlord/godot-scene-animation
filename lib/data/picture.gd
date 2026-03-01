class_name PictureData extends Resource

@export var name : String = ""
@export_file("*.png", "*.jpg", "*.jpeg", "*.webp") var bitmap: String
@export var tags : Array[String] = []
@export var spritesheet : SpriteData = null
#
var _buffer : Texture2D = null;

func _init():
	if !spritesheet:
		spritesheet = SpriteData.new()
		spritesheet.type = SpriteData.SpriteType.Empty

func alias() -> String : return name if name.length() else bitmap
func picture_tags() -> Array[String] : return tags
func texture() -> Texture2D:
	if !bitmap.is_empty():
		_buffer = load(bitmap)
	return _buffer

func createanimation( ) -> SpriteAnimation: return SpriteAnimation.new( self )
