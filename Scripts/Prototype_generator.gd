class_name PrototypeGenerator
extends Control


@export var label : Label

@export var GeneratorButton : Button

@export var timer : Timer


@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views

var Asset : int

func _ready() -> void:
	update_label_text()
	
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)


func create_asset(amountCreated : int) -> void:
	Asset += amountCreated
	update_label_text()

## Update the label of the amount of assets
func update_label_text() -> void:
	label.text = "Asset : %s" %Asset


## GENERATOR SECTION OF CODE
func begin_generator() -> void:
	timer.start()
	GeneratorButton.disabled = true


func _on_auto_gen_pressed():
	begin_generator()


func _on_timer_timeout():
	create_asset(2)

## ///////////////////////////////////////////////////////////////////////////

#Signal Reading

## Watch for nav request
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false




