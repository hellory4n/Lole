extends TextEdit

@export var the_thing: Control

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
