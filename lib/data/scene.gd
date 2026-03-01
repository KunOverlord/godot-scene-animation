class_name SceneData extends Resource

#describe all scene data contents
@export var pictures : Array[PictureData] = []
#setup scene variables to hold by the Scene Node
@export var variables: Dictionary[String,int] = {}

var _animations : Array[SpriteAnimation] = []

func load( ):
	for i in pictures:
		var animation = pictures[i].createanimation()
		if animation : _animations.append(animation)
			

func animations() -> Array[SpriteAnimation] : return _animations
func count() -> int : return _animations.size()
