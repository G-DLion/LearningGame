extends Camera2D

var test = 0
var toggle = false
# Called when the node enter the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if toggle == true:
		transform = test.transform


func _on_area_2d_change_cam(body):
	test = body
	toggle = true
	make_current()
	
