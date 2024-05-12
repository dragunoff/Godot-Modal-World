@tool
extends EditorPlugin


func _enter_tree():
	var plugin_path = get_script().resource_path.get_base_dir()

	add_autoload_singleton("ModalWorld", plugin_path + "/nodes/ModalWorld/ModalWorld.gd")


func _exit_tree():
	remove_autoload_singleton("ModalWorld")
