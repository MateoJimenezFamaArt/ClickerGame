class_name PrototypeClicker
extends Control
## A clicker Prototype creating Assets.


@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views



## Function to update the label of the amount of assets at launch
func _ready() -> void:
	visible = true
	
	user_interface.navigation_requested.connect(_on_navigation_request)


## Add the specfied amount of assets 
func create_asset() -> void:
	HandlerAssets.ref.trigger_clicker()


## Acts when the button is pressed
func _on_create_assets_pressed() -> void:
	create_asset()

#Signal Reading

##Wach out for navigation request and act acordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false
