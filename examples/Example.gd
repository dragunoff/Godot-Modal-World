extends Control
## Base class for all examples.

@export_category("UI")

## [Button] that opens the modal.
@export var open_button: Button

## [Label] that displays the modal resolution.
@export var resolution_label: Label

## [Label] that displays the resolution payload.
@export var payload_label: Label

@export_category("Modal")

## The modal window scene.
@export var scene: PackedScene

## [ModalConfig] for this instance.
@export var config: ModalConfig

## Custom data passed into this instance.
@export var data: String


func _ready() -> void:
	assert(is_instance_valid(open_button))
	assert(is_instance_valid(resolution_label))
	assert(is_instance_valid(payload_label))
	assert(is_instance_valid(config))

	open_button.grab_focus()

	open_button.pressed.connect(func():
		var modal: ModalWindow = ModalWorld.open(scene, config)

		modal.resolved.connect(func(resolution):
			var reason: String = resolution.reason if resolution != null else "null"
			resolution_label.text = "Reason: \"%s\"" % reason

			if resolution != null:
				payload_label.text = "Payload: \"%s\"" % resolution.payload

			open_button.grab_focus()
		)
	)
