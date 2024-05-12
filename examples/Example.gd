extends Control
## Base class for all examples.

@export_category("UI")

## [Button] that opens the modal.
@export var open_button: Button

## [Label] that displays the modal resolution.
@export var resolution_label: Label

@export_category("Modal")

## The modal window scene.
@export_file("*.tscn") var scene := "res://examples/ModalWindow.tscn"

## [ModalConfig] for this instance.
@export var config: ModalConfig


func _ready() -> void:
	assert(is_instance_valid(open_button))
	assert(is_instance_valid(resolution_label))
	assert(is_instance_valid(config))

	open_button.grab_focus()

	open_button.pressed.connect(func():
		var modal: ModalWindow = ModalWorld.open(scene, config)

		modal.resolved.connect(func(resolution):
			resolution_label.text = "Modal resolved with \"%s\"" % resolution
			open_button.grab_focus()
		, CONNECT_ONE_SHOT)
	)
