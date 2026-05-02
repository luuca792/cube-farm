extends Node

#Map <String item_name, ItemData item>
var items: Dictionary = {}

func _ready() -> void:
	var dir = DirAccess.open(GameSettingConst.ITEM_RESOURCE_PATH)
	for file_name in dir.get_files():
		if file_name.ends_with(".tres"):
			var item = load(GameSettingConst.ITEM_RESOURCE_PATH + file_name)
			if item != null:
				_register(item)

func _register(item: ItemData) -> void:
	items[item.item_name] = item

func get_item(item_name: String) -> ItemData:
	return items[item_name]
	
func get_item_by_name(item_name: String) -> ItemData:
	for i in items.size():
		if items[i]["item_name"] == item_name:
			return items[i]
	return null
	
func get_item_by_names(names: Array[String]) -> Array[ItemData]:
	var item : Array[ItemData] = []
	for item_name in names:
		var matched_item = items.get(item_name)
		if items.get(item_name) != null:
			item.append(matched_item)
	return item
