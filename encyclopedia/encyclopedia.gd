extends Node

@export var document_tree: Dictionary

func save():
	var yes = JSON.stringify(document_tree, "    ")
	var file = FileAccess.open("user://document_tree.json", FileAccess.WRITE)
	file.store_string(yes)

func _init():
	if FileAccess.file_exists("user://document_tree.json"):
		var file = FileAccess.open("user://document_tree.json", FileAccess.READ)
		var m = file.get_as_text()
		document_tree = JSON.parse_string(m)
	else:
		generate_new_tree()

func generate_new_tree():
	document_tree = {
		name = "Home",
		content = "[font_size=24][b]Home[/b][/font_size]\n\n",
		children = []
	}
	document_tree.children.append({
		name = "Locations",
		content = "[font_size=24][b]Locations[/b][/font_size]\nHere you may put the physical locations so they can be referenced in the map.",
		children = []
	})
	document_tree.children.append({
		name = "Characters",
		content = "[font_size=24][b]Characters[/b][/font_size]\nHere you may put the characters of the game.",
		children = []
	})
	document_tree.children.append({
		name = "Websites",
		content = "[font_size=24][b]Websites[/b][/font_size]\nHere you may put the websites inside the game.",
		children = []
	})
	document_tree.children.append({
		name = "Items",
		content = "[font_size=24][b]Items[/b][/font_size]\nHere you may put the items inside the game.",
		children = []
	})
	
	save()
