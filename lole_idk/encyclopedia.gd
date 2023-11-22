extends Node

@export var document_tree: Page

func to_dict(page: Page) -> Dictionary:
	var m = {
		"name": page.name,
		"content": page.content,
		"children": []
	}

	for fisjgs in m["children"]:
		var j = to_dict(fisjgs)
		m["children"].append(j)
	
	return m

func from_dict(m: Dictionary) -> Page:
	var g = Page.new(m["name"], m["content"])
	
	for hjdhd in m["children"]:
		var gjsg = from_dict(hjdhd)
		g.children.append(gjsg)
	
	return g

func save():
	var yes = JSON.stringify(to_dict(document_tree), "    ")
	var file = FileAccess.open("user://document_tree.json", FileAccess.WRITE)
	file.store_string(yes)

func _init():
	if FileAccess.file_exists("user://document_tree.json"):
		var file = FileAccess.open("user://document_tree.json", FileAccess.READ)
		var m = file.get_as_text()
		document_tree = from_dict(JSON.parse_string(m))
	else:
		generate_new_tree()

func generate_new_tree():
	document_tree = Page.new("Home", "[font_size=24][b]Home[/b][/font_size]\n\n")
	document_tree.children.append(Page.new(
		"Locations",
		"[font_size=24][b]Locations[/b][/font_size]\nHere you may put the physical locations so they can be referenced in the map."
	))
	document_tree.children.append(Page.new(
		"Characters",
		"[font_size=24][b]Characters[/b][/font_size]\nHere you may put the characters of the game."
	))
	document_tree.children.append(Page.new(
		"Websites",
		"[font_size=24][b]Websites[/b][/font_size]\nHere you may put the websites inside the game."
	))
	document_tree.children.append(Page.new(
		"Items",
		"[font_size=24][b]Items[/b][/font_size]\nHere you may put the items inside the game."
	))
	
	save()
