extends TextEdit

@export var the_thing: Control

func _on_tab_container_tab_changed(tab: int):
	if tab == 1:
		the_thing.add_child(RichTextLabel.new())
	else:
		the_thing.get_node("yes").queue_free()
