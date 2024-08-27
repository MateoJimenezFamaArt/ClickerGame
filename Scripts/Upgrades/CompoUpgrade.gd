class_name CompoUpgrade
extends Control
## Component displpaying an upgrade

## Reference to title
@export var label_title : Label
## Reference to description
@export var lable_description : RichTextLabel
## Reference to button
@export var button : Button

## Upgrade to display
var upgrade : Up01ClickerUpgrade

func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	
	update_label_title()
	update_label_description()
	update_button()
	
	
	HandlerAssets.ref.created_asset.connect(update_button)
	HandlerAssets.ref.consumed_assets.connect(update_button)
	
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)


## Upgrades the title of the upgrade
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_title.text = text

## Updates the description of the upgrade
func update_label_description() -> void:
	lable_description.text = upgrade.description()


##Updates the button availability 
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	
	button.disabled = true


## Triggered when purchase button is pressed
func _on_purchase_button_pressed():
	upgrade.level_up()
	
