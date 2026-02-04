class_name SceneData extends Resource

#describe all scene data contents
@export var sprites : Array[SpriteData] = []
#setup scene variables to hold by the Scene Node
@export var variables: Dictionary[String,int] = {}

func count() -> int : return sprites.size()
