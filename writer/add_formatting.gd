extends Button

enum Fucker {
	Bold,
	Italic,
	Table,
	Cell,
	Hint,
	UnorderedList,
	OrderedList,
	Code,
	Strikethrough,
	Underline
}

@export var mode: Fucker
@export var idiocity: Writer

func _pressed():
	# couldn't figure out how to make match not very mad, i made this while my internet was ded
	if mode == Fucker.Bold:
		idiocity.insert_text_at_caret("[b][/b]")
	if mode == Fucker.Italic:
		idiocity.insert_text_at_caret("[i][/i]")
	if mode == Fucker.Table:
		idiocity.insert_text_at_caret("[table=Insert amount of columns here]\n\n[/table]")
	if mode == Fucker.Cell:
		idiocity.insert_text_at_caret("[cell][/cell]")
	if mode == Fucker.Hint:
		idiocity.insert_text_at_caret("[hint=Insert hint here][/hint]")
	if mode == Fucker.UnorderedList:
		idiocity.insert_text_at_caret("[ul]\n\n[/ul]")
	if mode == Fucker.OrderedList:
		idiocity.insert_text_at_caret("[ol]\n\n[/ol]")
	if mode == Fucker.Code:
		idiocity.insert_text_at_caret("[code][/code]")
	if mode == Fucker.Strikethrough:
		idiocity.insert_text_at_caret("[s][/s]")
	if mode == Fucker.Underline:
		idiocity.insert_text_at_caret("[u][/u]")
