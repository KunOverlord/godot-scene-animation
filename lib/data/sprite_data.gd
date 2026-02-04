class_name SpriteData extends Resource

enum SpriteType { Static, Default, Interactive }

@export var cols : int = 0
@export var rows : int = 0
@export var fps : int = 14
@export var type : SpriteType = SpriteType.Default

@export var pictures : Array[PictureData] = []
@export var framesets : Array[FrameData] = []
@export var hotspots: Array[HotSpot] = []


func first() -> FrameData : return framesets[0] if framesets.size() else null

func createloop() -> AnimationLoop :
	var first = first()
	return first.createloop() if first else null
