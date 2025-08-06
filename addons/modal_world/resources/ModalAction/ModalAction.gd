class_name ModalAction
extends Resource
## An action used to resolve a modal.

## Text label for the button.
@export var label := ""

## An optional [ModalResolution] resource emitted when the button is pressed.
## This can be [null] if not needed (e.g. when dismissing a modal).
@export var resolution: ModalResolution

## Should this button grab the UI focus.
## If multiple actios have this flag turned ON then the focus will end up in the last one.
## If none of the actions have it then focus will be given to the first action.
@export var grab_focus := false

## An optional [Shortcut] associated with the button.
@export var shortcut: Shortcut


func _init(
	_label := "",
	_resolution: ModalResolution = null,
	_grab_focus := false,
	_shortcut: Shortcut = null,
) -> void:
	label = _label
	resolution = _resolution
	grab_focus = _grab_focus
	shortcut = _shortcut
