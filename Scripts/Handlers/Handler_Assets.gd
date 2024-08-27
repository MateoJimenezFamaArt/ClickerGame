class_name HandlerAssets
extends Node
## Manages assets and related signals

##Singleton Reference
static var ref : HandlerAssets



## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emited when asset created
signal created_asset(amountCreated : int)
## Emited when asset consumed
signal consumed_assets(amountConsumed : int)



func asset() -> int:
	return Game.ref.data.Asset

## creates certain amount of assets
func create_asset(amountCreated : int) -> void:
	Game.ref.data.Asset += amountCreated
	created_asset.emit(amountCreated)

## consumes certain amount of assets
func consume_asset(amountConsumed : int) -> Error:
	if amountConsumed > Game.ref.data.Asset:
		return Error.FAILED
	
	Game.ref.data.Asset -= amountConsumed
	consumed_assets.emit(amountConsumed)
	
	return Error.OK
	
	
	#Triggered By the clicker upgrade cretes extra assets
func trigger_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	
	create_asset(quantity)
