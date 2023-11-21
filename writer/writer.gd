extends CodeEdit
class_name Writer

@export var the_thing: Control

func _ready():
	set_anchor_and_offset(SIDE_TOP, 0, 60)
	set_anchor_and_offset(SIDE_LEFT, 0, 10)
	set_anchor_and_offset(SIDE_RIGHT, 1, -10)
	set_anchor_and_offset(SIDE_BOTTOM, 1, -10)

func _on_tab_container_tab_changed(tab: int):
	if tab == 1:
		var thingy = RichTextLabel.new()
		thingy.name = "yes"
		thingy.bbcode_enabled = true
		thingy.append_text(text)
		thingy.set_anchor_and_offset(SIDE_TOP, 0, 10)
		thingy.set_anchor_and_offset(SIDE_LEFT, 0, 10)
		thingy.set_anchor_and_offset(SIDE_RIGHT, 1, 10)
		thingy.set_anchor_and_offset(SIDE_BOTTOM, 1, 10)
		the_thing.add_child(thingy)
	else:
		the_thing.get_node("yes").queue_free()
