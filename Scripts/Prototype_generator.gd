class_name PrototypeGenerator
extends Control


@export var GeneratorButton : Button

@export var timer : Timer


@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views


func _ready() -> void:
	
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)


func create_asset() -> void:
	HandlerAssets.ref.create_asset(2)


## GENERATOR SECTION OF CODE
func begin_generator() -> void:
	timer.start()
	GeneratorButton.disabled = true


func _on_auto_gen_pressed():
	begin_generator()


func _on_timer_timeout():
	create_asset()

## ///////////////////////////////////////////////////////////////////////////

#Signal Reading

## Watch for nav request
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false




