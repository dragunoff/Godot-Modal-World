extends Control
## An autoload that takes care of opening modal instances.

## A wrapper around each modal instance.
const WRAPPER_SCENE := preload("res://addons/modal_world/scenes/ModalWrapper/ModalWrapper.tscn")


## Open a modal instance.[br]
##
## [scene] Path to the modal window scene. The scene must have a
## script attached that is (or extends) [ModalWindow].[br]
## [config] [ModalConfig] for this instance.[br]
##
## Returns the modal instance.
func open(scene: String, config: ModalConfig) -> ModalWindow:
	var modal: ModalWindow = load(scene).instantiate() as ModalWindow
	modal.config = config

	var wrapper = WRAPPER_SCENE.instantiate()
	wrapper.backdrop.color = config.backdrop
	wrapper.add_child(modal)
	get_viewport().add_child(wrapper)

	modal.tree_exited.connect(func(): wrapper.queue_free(), CONNECT_ONE_SHOT)

	modal.resolved.connect(func(_resolution): wrapper.queue_free(), CONNECT_ONE_SHOT)

	return modal
