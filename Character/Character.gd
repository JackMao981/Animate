extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide_and_show($Idle)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func hide_and_show(animation):
	for node in get_children():
		node.hide()
	
	animation.show()
