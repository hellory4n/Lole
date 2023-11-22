extends Tree

# key is TreeItem, value is the writer ui
var items = {}
@export var root_writer: Control
@export var content_root: Control
@export var writer: PackedScene
var current_page: TreeItem

func _ready():
	process_page(Encyclopedia.document_tree)
	current_page = get_root()
	items[current_page].visible = true
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
	
func process_page(page: Dictionary, tree_item_parent: TreeItem = null):
	var yes = create_item(tree_item_parent)
	yes.set_text(0, page.name)
	yes.set_editable(0, true)
	yes.custom_minimum_height = 40
	
	var m = writer.instantiate()
	m.get_node("TabContainer/Writer/Gkggg").text = page.content
	m.visible = false
	items.merge({yes: m})
	content_root.add_child(m)
	
	for item in page.children:
		process_page(item, yes)
