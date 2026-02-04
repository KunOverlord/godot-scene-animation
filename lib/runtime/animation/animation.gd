class_name SpriteAnimation

var data : SpriteData = null

var loop : AnimationLoop = null

func _init( spritedata : SpriteData ):
	data = spritedata
	#loop = spritedata.first().createloop()
	pass
