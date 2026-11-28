extends CanvasLayer

@onready var panel: PanelContainer = $PanelContainer
@onready var name_label: Label = $PanelContainer/MarginContainer/VBoxContainer/name_label
@onready var label: Label = $PanelContainer/MarginContainer/VBoxContainer/dialogue_label

var lines: Array[String] = []
var current_line: int = 0
var is_active: bool = false

func _ready() -> void:
	panel.visible = false

func start_dialogue(new_lines: Array[String], speaker: String = "") -> void:
	lines = new_lines
	current_line = 0
	is_active = true
	panel.visible = true
	name_label.text = speaker
	name_label.visible = speaker != ""
	label.text = lines[current_line]

func next_line() -> void:
	current_line += 1
	if current_line < lines.size():
		label.text = lines[current_line]
	else:
		end_dialogue()

func end_dialogue() -> void:
	is_active = false
	panel.visible = false
