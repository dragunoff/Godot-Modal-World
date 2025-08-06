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

## Should the focus be grabbed automaticaly by the modal.
## Set this to false to manage focus manually.
@export var auto_focus := true


func _init(
	_title := "",
	_body := "",
	_actions: Array[ModalAction] = [],
	_backdrop := Color(0, 0, 0, 0.5),
	_auto_focus := true
) -> void:
	title = _title
	body = _body
	actions = _actions
	backdrop = _backdrop
	auto_focus = _auto_focus
