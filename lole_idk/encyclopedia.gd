extends Node

@export var document_tree: Page

func save():
	ResourceSaver.save(document_tree, "user://document_tree.tres")

func _init():
	if ResourceLoader.exists("user://document_tree.tres"):
		document_tree = load("user://document.tree.tres")
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
		"[font_size=24][b]Characters[/b][/font_size]\n
		Here you may put the characters of the game."
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
