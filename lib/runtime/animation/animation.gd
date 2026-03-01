class_name SpriteAnimation

var _picture : PictureData = null
var _spritesheet : SpriteData  = null
var _loop : AnimationLoop = null
var _playing = false

func _init( picture : PictureData ):
	_picture = picture
	_spritesheet = _picture.spritesheet if _picture else null
	play(first())

func framesets() -> Array[FrameData]: return spritesheet().framesets
func frameset( name : String ) -> FrameData : return spritesheet().frameset(name)
func alias() -> String: return _picture.alias() if _picture else ""
func spritesheet() -> SpriteData: return _spritesheet
func loop() -> AnimationLoop : return _loop

func first() -> String: return _spritesheet.first().name if _spritesheet and _spritesheet.first() else ""
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
