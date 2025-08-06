class_name ModalResolution
extends Resource

## A resolution object attached to a [ModalAction].
## Emitted when resolving a modal with the given action.


## The reason for the resolution.
@export var reason: String

## The data associated with the resolution.
@export var payload: Dictionary


func _init(
	_reason: String = "",
	_payload: Dictionary = {},
) -> void:
	reason = _reason
	payload = _payload
