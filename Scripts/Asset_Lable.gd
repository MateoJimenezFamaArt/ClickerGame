class_name LabelAsset
extends Label

##Displays current amount of assets available

##Conecting signals 
func _ready() -> void:
	update_text()
	HandlerAssets.ref.created_asset.connect(update_text)
	HandlerAssets.ref.consumed_assets.connect(update_text)


func update_text(_Amount : int = -1) -> void:
	text = "Assets : %s" %HandlerAssets.ref.asset()
