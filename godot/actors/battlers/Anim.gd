extends Position2D

onready var anim = $AnimationPlayer
onready var shield = $Shield
signal completed

func _ready():
	shield.visible = false
	
	
func play_appear():
	anim.play("appear")
	yield(anim, "animation_finished")

func play_disappear():
	anim.play("disappear")
	yield(anim, "animation_finished")

func play_idle():
	anim.play("idle")
	yield(anim, "animation_finished")

func play_invincible():
	anim.play("invincible")
	yield(anim, "animation_finished")
	emit_signal("completed")