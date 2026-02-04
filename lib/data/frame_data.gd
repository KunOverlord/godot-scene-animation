class_name FrameData extends Resource

@export var name : String  = "frameset"
@export var loops : int = 0
@export var fps : int = 12

@export var frames : Array[int] =  []
@export var next : Array[String] =  []
@export var sound : Array[String] =  []

#to define touch spots
@export var spots : Dictionary[String,HotSpot] =  {}


func count( ) -> int : return frames.size()
func getframe( index : int  = 0 ) -> int : return frames[index] if count() else 0
func getnext() -> String : return next[ randi() % count() ] if count() else ""
func createloop() -> AnimationLoop : return AnimationLoop.new(self)
