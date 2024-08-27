class_name PrototypeUpgrades
extends Control
## Prototype Upgrades

@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views


## Function to update the label of the amount of assets at launch
func _ready() -> void:
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)



##Wach out for navigation request and act acordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false
