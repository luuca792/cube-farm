extends Node
class_name TileLoader

#	{
#		"source_id": int,
#		"count": int,
#		"tiles": [
#			0: Vector2i(0,0),
#			1: Vector2i(1,0),
#			2: Vector2i(2,0)
#		]
# }
##	Load tiles in horizontal line
func load_strip(source_id: int, from_y: int, count: int) -> Dictionary:
	var node := { "source_id": source_id, "count": count }
	var tiles = {}
	for i in count:
		tiles[i] = Vector2i(i, from_y)
	node["tiles"] = tiles
	return node

#	{
#		"source_id": int,
#		"count": int,
#		"variants": [
#			Vector2i(0,0),
#			Vector2i(1,0),
#			Vector2i(2,0)
#		]
# }
##	Load tiles in grid
func load_grid(source_id: int, from: Vector2i, to: Vector2i) -> Dictionary:
	var node := { "source_id": source_id }
	var variants := []
	for y in range(from.y, to.y + 1):
		for x in range(from.x, to.x + 1):
			variants.append(Vector2i(x, y))
	node["variants"] = variants
	return node
