class_name AnimationData extends Resource

enum SpriteType { Empty , Static, Default, Interactive }

@export var skins : Array[SkinData] = []
@export var type : SpriteType = SpriteType.Default
@export_range(1,128) var cols : int = 1
@export_range(1,128) var rows : int = 1

@export_group("Frame Contents")
@export var framesets : Array[FrameData] = []
@export var fps : int = 14
@export var hotspots: Array[HotSpot] = []

func _init(): pass

func has( name : String = "" ):
	if name.length() : for s in skins: if s.has(name) : return true
	return false

func first() -> FrameData :
	return framesets[0] if framesets.size() else null

func list( name : String ) -> Array[FrameData]:
	var fs = []
	for i in framesets: if framesets[i].name == name : fs.append(framesets[i])
	return fs

func frameset( name : String ) -> FrameData:
	var selection = list(name)
	return selection[randi() % selection.size()] if selection.size() else null

func createloop() -> AnimationLoop :
	var first = first()
	return first.createloop() if first else null


func createanimation( picture :PictureData):
	return SpriteAnimation.new(picture,self) if picture else null

static func create_static() -> AnimationData: return AnimationData.new()
