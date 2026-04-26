extends Node

var items: Dictionary = {}


const CROPS = [0,1]

func _ready() -> void:
	_register(preload("res://resources/items/tres/wheat_seed.tres"))
	_register(preload("res://resources/items/tres/carrot_seed.tres"))

func _register(item: ItemData) -> void:
	items[item.id] = item

func get_item(id: int) -> ItemData:
	if items.has(id):
		return items[id]
	push_error("ItemRegistry: no item with id %d" % id)
	return null
