extends TextEdit

@export var the_thing: RichTextLabel

func _on_text_changed():
	the_thing.push_bold()
