class_name SpriteData extends Resource

enum SpriteType { Empty , Static, Default, Interactive }

@export_range(1,128) var cols : int = 1
@export_range(1,128) var rows : int = 1
@export var fps : int = 14
@export var type : SpriteType = SpriteType.Default

@export_group("Frame Contents")
@export var framesets : Array[FrameData] = []
@export var hotspots: Array[HotSpot] = []

func _init(): pass

func first() -> FrameData : return framesets[0] if framesets.size() else null

func find( name : String ) -> Array[FrameData]:
	var fs = []
	for i in framesets: if framesets[i].name == name : fs.append(framesets[i])
	return fs

func frameset( name : String ) -> FrameData:
	var selection = find(name)
	return selection[randi() % selection.size()] if selection.size() else null

func createloop() -> AnimationLoop :
	var first = first()
	return first.createloop() if first else null

static func create_static() -> SpriteData: return SpriteData.new()
