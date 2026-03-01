class_name AnimationLoop

var _frame : int = 0
var _loop : int = 0
var _fs : FrameData = null

func _init( framedata : FrameData ):
	_fs = framedata
	_frame = 0
	_loop = 0
func type() -> FrameData.Type : return _fs.type if _fs else FrameData.Type.Static
func count() -> int : return _fs.count() if _fs else 0
func length() -> int : return _fs.loops if _fs else 0
func completed() -> bool : return _loop == 0
func next() -> String : return _fs.getnext() if _fs else ""
func getframe( frame : int = 0) -> int : return _fs.getframe(frame) if _fs else 0
func last( getindex : bool = false ) -> int : return _fs.count() - 1 if getindex else getframe(last(true))

func ready() -> bool :  return _fs and _fs.animated()

func first() -> int : return _fs.getframe() if _fs else 0

func loop() -> int:
	if _fs and length(): _loop = ++_loop % length()
	return _loop

func frame() -> int :
	if ready():
		_frame = ++_frame % _fs.count()
		if _frame == 0: loop()
	return _frame

func update() -> bool :
	frame()
	return completed()



	
