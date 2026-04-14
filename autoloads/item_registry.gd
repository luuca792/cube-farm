extends Node

var items: Dictionary = {}

func _ready() -> void:
	_register(preload("res://items/resources/wheat_seed.tres"))

func _register(item: ItemData) -> void:
	items[item.id] = item

func get_item(id: int) -> ItemData:
	if items.has(id):
		return items[id]
	push_error("ItemRegistry: no item with id %d" % id)
	return null
