extends StaticBody2D

enum SpikeType {Perma, Timed}
export var type = SpikeType.Perma
var active = 0

# Called when the node enters the scene tree for the first time.
#func _ready():
#	$PermaSprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if type == SpikeType.Timed and $ToggleTimer.is_stopped():
#		$ToggleTimer.start()
#		active = not active


func _on_PermaHitbox_body_entered(body):
	if body.is_in_group("Player"):
		$SFXHurt.play()
		body.damage(false)
#		set_collision_mask_bit(0, false)
