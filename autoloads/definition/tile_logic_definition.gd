extends Node

# This class define what item can be applied on what tile group

var item_on_soil : Array[ItemData]
var item_on_watered_soil : Array[ItemData]
var item_on_growing_crop : Array[ItemData]
var item_on_grown_crop : Array[ItemData]

func _ready() -> void:
	item_on_soil = ItemRegistry.get_item_by_names([
		ItemNameConst.WATER_CAN
	])
	item_on_watered_soil = ItemRegistry.get_item_by_names([
		ItemNameConst.WHEAT_SEED,
		ItemNameConst.CARROT_SEED
	])
	item_on_growing_crop = ItemRegistry.get_item_by_names([
		
	])
	item_on_grown_crop = ItemRegistry.get_item_by_names([
		
	])
