extends StaticBody2D


export (float) var timer = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	idle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $Timer.is_stopped():
		idle()


func idle():
#	print("idle")
	$SnapAnim.stop()
	
	$SpikeHitbox/CollisionShape2D.disabled = true
	$SpikeHitbox.set_collision_mask_bit(0, false)
	
	$IdleAnim.visible = true
	$SnapAnim.visible = false
	$IdleShape.disabled = false
	$SnapShape.disabled = true
	if $Timer.is_stopped():
		$Timer.wait_time = timer
		$Timer.start()


func _on_Timer_timeout():
#	print("snap")
	$SnapAnim.play("snap")

	$SpikeHitbox/CollisionShape2D.disabled = false
	$SpikeHitbox.set_collision_mask_bit(0, true)
	
	$IdleAnim.visible = false
	$SnapAnim.visible = true
	$IdleShape.disabled = true
	$SnapShape.disabled = false


func _on_SnapAnim_animation_finished():
	idle()


func _on_SpikeHitbox_body_entered(body):
	if body.is_in_group("Player"):
		body.damage(false)
