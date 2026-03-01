class_name AnimatedScene extends Node2D

#define the scene sprites
@export var pictures : Array[PictureData] = []

var _animations : Array[SpriteAnimation] = []

func _init():
	pass
	
func animations() : return _animations
	
func load_animations():
	for i in pictures:
		_animations.append(pictures[i].createanimation())
	print("Running animations: "  , animations() )
