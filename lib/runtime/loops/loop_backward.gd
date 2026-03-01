class_name LoopBackward extends AnimationLoop

func completed() -> bool : return _fs and _loop == _fs.count() - 1

func frame() -> int :
	if ready():
		_frame = ++_frame % _fs.count() if _frame > 0 else last(true)
		if _frame == 0: loop()
	return _frame
