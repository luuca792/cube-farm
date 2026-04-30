extends Node

## Emit when player click on a tile in tilemap.
## This is fired by InteractManager
signal tile_pressed(world_pos: Vector2)

signal item_pressed(slot: InventorySlot)
signal item_released()

signal tile_painted_with_item(world_pos: Vector2)
