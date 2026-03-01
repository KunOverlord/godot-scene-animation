class_name SceneData extends Resource

#describe all scene data contents
@export var pictures : Array[PictureData] = []
#setup scene variables to hold by the Scene Node
@export var variables: Dictionary[String,int] = {}

var _playlist : Array[SpriteAnimation] = []

func load( ):
	for i in pictures:
		var animation = pictures[i].createanimation()
		if animation : _playlist.append(animation)
			

func animations() -> Array[SpriteAnimation] : return _playlist

func count() -> int : return _playlist.size()
