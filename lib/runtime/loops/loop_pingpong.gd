class_name LoopPingPong extends AnimationLoop

var _backwards :bool = false

func _init( framedata : FrameData ):
	super._init(framedata)
	
func completed() -> bool : return !_backwards and _frame == 0

func frame() -> int :
	if ready():
		if _backwards :
			if --_frame <= 0:
				_backwards = false
				_frame = 0
				loop()
		elif ++_frame >= count() - 1 : _backwards = true
	return _frame
