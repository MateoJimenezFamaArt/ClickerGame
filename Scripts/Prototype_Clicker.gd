class_name PrototypeClicker
extends Control
## A clicker Prototype creating Assets.

## reference to the label displaying amount of assets
@export var AssetCount : Label


@export var user_interface : UserInterface
## View reference
@export var view : UserInterface.Views

## variable to store the amount of assets
var Asset : int = 0

## Function to update the label of the amount of assets at launch
func _ready() -> void:
	update_label_text()
	
	visible = true
	
	user_interface.navigation_requested.connect(_on_navigation_request)

## Add the specfied amount of assets 
func create_asset(amountCreated : int) -> void:
	Asset += amountCreated
	update_label_text()

## Update the label of the amount of assets
func update_label_text() -> void:
	AssetCount.text = "Asset : %s" %Asset

## Acts when the button is pressed
func _on_create_assets_pressed() -> void:
	create_asset(1)


## ////////////////////////////////////////////////////////////////////////////

#Signal Reading

##Wach out for navigation request and act acordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	
	visible = false
