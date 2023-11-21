extends Tree

@onready var root = create_item()
# key is TreeItem, value is the writer ui
var items = {}
@export var root_writer: Control
@export var content_root: Control
@export var writer: PackedScene
var current_page: TreeItem

func _ready():
	root.set_text(0, "Home")
	items.merge({root: root_writer})
	current_page = root
	
	set_anchor_and_offset(SIDE_TOP, 0, 60)

func add_items_omgomgomgomg():
	var epic_new_item = create_item(get_selected())
	epic_new_item.set_text(0, "New Document")
	epic_new_item.set_editable(0, true)
	var m = writer.instantiate()
	items.merge({epic_new_item: m})
	content_root.add_child(m)

func select_item():
	items[current_page].visible = false
	current_page = get_selected()
	items[current_page].visible = true
