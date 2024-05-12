class_name ModalWrapper
extends CanvasLayer
## A wrapper around each modal instance.
## Contains the backdrop and makes sure the modal is on top of everything.

## [ColorRect] that serves as the backdrop.
@export var backdrop: ColorRect


func _ready() -> void:
	assert(is_instance_valid(backdrop))
