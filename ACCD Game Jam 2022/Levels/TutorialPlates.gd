extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child.is_in_group("LightPlate"):
			child.connect("plate_press", self, "lights_handler")
		if child.is_in_group("Button"):
			child.connect("button_press", self, "lights_on")

func lights_handler(var num):
	var lightNode = get_parent().get_node("Lights")
	
	match num:
		1:
			lightNode.get_node("Light").turn_on()
			lightNode.get_node("Light2").turn_on()
			lightNode.get_node("Light3").turn_on()
			lightNode.get_node("Light4").turn_on()
			lightNode.get_node("Light5").turn_on()
			lightNode.get_node("Light6").turn_on()
			lightNode.get_node("Light7").turn_on()
			lightNode.get_node("Light8").turn_on()
			lightNode.get_node("Light9").turn_on()
			lightNode.get_node("Light10").turn_on()
#        _:
#            for child in lightNode.get_children(): 
#                child.perm_on()

				
func lights_on():
	var lightNode = get_parent().get_node("Lights")
	for child in lightNode.get_children(): 
		child.perm_on()

