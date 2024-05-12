class_name ModalConfig
extends Resource
## Holda the configuration for a modal instance.

## Title for the modal.
@export var title := ""

## Body text for the modal.
@export var body := ""

## An optional array of [ModalAction].
@export var actions: Array[ModalAction] = []

## [Color] value for the backdrop.
@export var backdrop := Color(0, 0, 0, 0.5)


func _init(
	_title := "",
	_body := "",
	_actions: Array[ModalAction] = [],
	_backdrop := Color(0, 0, 0, 0.5),
) -> void:
	title = _title
	body = _body
	actions = _actions
	backdrop = _backdrop
