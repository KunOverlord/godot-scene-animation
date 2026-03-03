class_name AnimatedScene extends Node2D

#define the scene sprites
@export var sprites : Array[AnimationData] = []
@export var pictures : Array[PictureData] = []
@export var view : Vector2i = Vector2i(600,400)

var _animations : Array[SpriteAnimation] = []

func _init(): load_pictures()
	
func animations() : return _animations
	
func load_pictures():
	for p in pictures: _animations.append(create_animation( p ))
	print("Running animations: "  , animations() )


func create_animation( picture : PictureData ) -> SpriteAnimation:
	for s in sprites:
		if s.has(picture.name): return SpriteAnimation.new(picture,s)
	return SpriteAnimation.new(picture)
