extends TextEdit
class_name Writer

@export var the_thing: Control

func _ready():
	set_anchor_and_offset(SIDE_TOP, 0, 31)

func _on_tab_container_tab_changed(tab: int):
	if tab == 1:
		var thingy = RichTextLabel.new()
		thingy.name = "yes"
		thingy.bbcode_enabled = true
		thingy.set_anchors_preset(PRESET_FULL_RECT)
		thingy.append_text(text)
		the_thing.add_child(thingy)
	else:
		the_thing.get_node("yes").queue_free()
