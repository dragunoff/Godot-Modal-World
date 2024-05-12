class_name ModalWindow
extends Control
## A modal window instance.

## Emitted when a modal action button is pressed.
signal resolved(resolution: String)

@export_category("Config")

## [ModalConfig] for this instance.
@export var config := ModalConfig.new()

@export_category("Nodes")

## [Label] that holds the title.
@export var title_label: Label

## [Label] that holds the body text.
@export var body_label: Label

## Array of [Button] nodes for each modal action in the config.
@export var buttons: Array[Button] = []


func _ready() -> void:
	assert(
		buttons.size() >= config.actions.size(),
		"Number of buttons is less than the number of actions."
	)

	_steal_focus()
	_setup_title()
	_setup_body()
	_setup_action_buttons()


## Steal the focus so it's not outside the modal.
func _steal_focus() -> void:
	focus_mode = Control.FOCUS_ALL
	grab_focus.call_deferred()


## Set the title label text.
func _setup_title() -> void:
	if config.title:
		if is_instance_valid(title_label):
			title_label.text = config.title
	else:
		title_label.queue_free()


## Set the body label text.
func _setup_body() -> void:
	if config.body:
		if is_instance_valid(body_label):
			body_label.text = config.body
	else:
		body_label.queue_free()


## Assign modal actions to buttons.## Set the title label text.
func _setup_action_buttons() -> void:
	for n in config.actions.size():
		var button = buttons[n]
		var action = config.actions[n]

		button.text = action.label

		button.pressed.connect(func(): resolved.emit(action.resolution), CONNECT_ONE_SHOT)

		# NOTE: Always auto-focus the first action
		# to make sure a button in the modal has focus
		if action.grab_focus || n == 0:
			button.grab_focus.call_deferred()

		if is_instance_valid(action.shortcut):
			button.shortcut = action.shortcut

	for unused_button in buttons.slice(config.actions.size()):
		unused_button.queue_free()
