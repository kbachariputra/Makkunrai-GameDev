extends StaticBody2D

@export var npc_name: String = ""

# baris dialog
@export_multiline var dialogue_lines: Array[String] = [
	"Halo! Apakah kamu seorang Eyekon?",
	"BTS DISBAND 2027!!!"
]

@onready var prompt_label: Label = $prompt_label

@onready var dialogue_box: CanvasLayer = get_tree().current_scene.get_node("%npc_dialogue")

var player_in_range: bool = false

func _ready() -> void:
	prompt_label.visible = false

func _unhandled_key_input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		if not dialogue_box.is_active:
			prompt_label.visible = false
			dialogue_box.start_dialogue(dialogue_lines, npc_name)
		else:
			dialogue_box.next_line()
			if not dialogue_box.is_active:
				prompt_label.visible = true

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "sang_ibu":
		player_in_range = true
		prompt_label.visible = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "sang_ibu":
		player_in_range = false
		prompt_label.visible = false
		if dialogue_box.is_active:
			dialogue_box.end_dialogue()
