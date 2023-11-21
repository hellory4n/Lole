extends Resource
class_name Page

@export var name: String = "New Page"
@export var content: String = "[font_size=24][b]New Page[/b][/font_size]\n\n"
@export var children: Array[Page]

func _init(_name, _content):
	name = _name
	content = _content
