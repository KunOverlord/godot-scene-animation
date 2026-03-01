class_name FrameData extends Resource

enum Type { Forward,Backward,PingPong,Static }

@export var name : String  = "frameset"
@export var loops : int = 0
@export var fps : int = 12

@export var frames : Array[int] =  []
@export var type : Type = Type.Forward
@export var next : Array[String] =  []
@export var sound : Array[String] =  []

#to define touch spots
@export var spots : Dictionary[String,String] =  {}

func _init(): pass


func count( ) -> int : return frames.size()
func empty() -> bool : return count() == 0
func animated() -> bool : return count() > 1
func getframe( index : int  = 0 ) -> int : return frames[index % frames.size()] if count() else 0
func getnext() -> String : return next[ randi() % count() ] if count() else ""

func createloop() -> AnimationLoop :
	match type:
		Type.Forward: return AnimationLoop.new(self)
		Type.Backward: return LoopBackward.new(self)
		Type.PingPong: return LoopPingPong.new(self)
		_: return LoopStatic.new(self)
