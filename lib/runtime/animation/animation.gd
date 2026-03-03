class_name SpriteAnimation

var _picture : PictureData = null
var _animation : AnimationData  = null
var _loop : AnimationLoop = null
var _playing = false

func _init( picture : PictureData , animation : AnimationData = null):
	_picture = picture
	if animation:
		_animation = animation
		play(first())

##identity
func alias() -> String: return _picture.alias() if _picture else ""
func sprite() -> AnimationData: return _animation
func texture() -> Texture2D : return _picture.texture() if _picture else null
func ready() -> bool : return texture() != null

## definition
func cols() -> int :
	return _animation.cols if _animation else 1
func rows() -> int :
	return _animation.rows if _animation else 1
func type() -> AnimationData.SpriteType :
	return _animation.type if _animation else AnimationData.SpriteType.Static


## frameset and loop related data
func framesets() -> Array[FrameData]: return sprite().framesets
func frameset( name : String ) -> FrameData : return sprite().frameset(name)
func loop() -> AnimationLoop : return _loop

func first() -> String: return _animation.first().name if _animation and _animation.first() else ""
func playing() -> bool : return _playing
func stop(): _playing = false

func play(name : String = "") -> bool :
	if name:
		var fs = frameset(name)
		_loop = fs.createloop() if fs else null
	_playing = true if _loop else false
	return playing()
	
func update() -> bool:
	if playing():
		if _loop.update(): #loop completed (will reset on next round)
			pass
		else: #loop still running
			pass
		return true
	return false

## spatial
func size( framed : bool = false ) -> Vector2i :
	return Vector2i(
		size().x / cols(),
		size().y / rows()
	) if framed else _picture.size()

func scale() -> Vector2 :
	return _picture.scale if _picture else Vector2.ONE

func position( ) -> Vector2i :
	return _picture.position if _picture else Vector2i.ZERO

func rectview( scaled :int = false) -> Rect2i :
	var size = size()
	if scaled: size *= scale()
	return Rect2i( Vector2i.ZERO, size )
	
func left() -> int : return position().x
func right() -> int : return position().x + rectview(true).size.x

func top() -> int : return position().y
func bottom() -> int : return position().y + rectview(true).size.y
