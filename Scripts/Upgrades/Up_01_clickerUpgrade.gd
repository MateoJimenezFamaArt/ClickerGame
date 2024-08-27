class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases Assets created by clicker

#Emited when elvel up
signal leveled_up


## UPgrade level
var level : int = 0
## Title or upgrade name
var title : String = "Clicker Upgrade"
## Base cost of upgrade
var base_cost : int = 5
## Current cost of the upgrade
var cost : int 

#Load data
func _init() -> void:
	level = Game.ref.data.up_01_level
	CalculateCost()


## Returns the description contaning all info
func description() -> String:
	var _description : String = "Increases the amount of assets created by the Clicker."
	_description += "\nEffects : +1 Assets / Level"
	_description += "\nCost : %s" %CalculateCost()
	return _description

## returns the cost based on level and base cost
func CalculateCost() -> int:
	return int(base_cost * pow(1.5, level))

## Return a bool to determine if the player can or cant buy the upgrade
func can_afford() -> bool:
	if HandlerAssets.ref.asset() >= CalculateCost():
		return true
	
	return false

## Consumed Assets to level up
func level_up() -> void:
	var error : Error = HandlerAssets.ref.consume_asset(CalculateCost())
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		
		CalculateCost()
		
		leveled_up.emit()
		


