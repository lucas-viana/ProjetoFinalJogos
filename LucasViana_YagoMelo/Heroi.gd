extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movimento = Vector2()
const UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movimento.y+=20

#pesquisar se as função com _ é de escopo restrito
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		movimento.x = 300
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -300
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = true
	else:
		movimento.x = 0
		$AnimatedSprite.play("parado")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			movimento.y= -550
	
	if position.y > 700:
		morre()
			
	movimento = move_and_slide(movimento,UP)
func morre():
	get_tree().change_scene("res://GameOver.tscn") 




func _on_Moeda_body_entered(body):
	pass # Replace with function body.


func _on_Portal_body_entered(body):
	pass # Replace with function body.


func _on_BandeiraVitoria_body_entered(body):
	pass
