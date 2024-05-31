# Modal windows for Godot 4.x

A Godot 4.x plugin for managing modal windows. Modal windows are blocking and appear on top of everything. The title, body text, backdrop color and the modal action buttons can be controlled via configuration.

## How to use the plugin

1. Download from the asset library.
1. Activate plugin in project settings.
1. Create your modal window scene and attach a `ModalWindow` script to it. See the `examples` directory in this repository.
1. Use the provided autoload `ModalWorld`

## The modal window scene

You have full control over the layout of the scene. It just needs to have the `ModalWindow` script (or a script extending it) attached to it. Here are how some example scenes look (the source is found in the `examples` directory):

![Blocking](/media/screenshot-blocking.png)

![Confirmation](/media/screenshot-notification.png)

![Notification](/media/screenshot-confirmation.png)

![Three button](/media/screenshot-three-button.png)

## Opening and closing a modal

Here's an example of creating a modal with two acitons in GDScript:

```GDScript
var config = ModalConfig.new(
    "Title",
    "Body text",
    [
        ModalAction.new(
            "Confirm",
            "confirmed",
        ),
        ModalAction.new(
            "Cancel",
            "cancelled",
        )
    ]
)

ModalWorld.open("path/to/your/modal/scene", config)
```

Another way is to export the config from a script so it can be managed from the resource editor in Godot:

```GDScript
extends Node

@export_file("*.tscn") var scene: String
@export var config: ModalConfig


func _ready() -> void:
    var modal = ModalWorld.open(scene, config)

    modal.resolved.connect(func(resolution):
        print(resolution)
    )
```

The `ModalWorld.open` method returns a `ModalWindow` instance which emits a `resolved` signal when closed. The reason for closing the modal is in the signal payload and is determined by the `ModalAction` that is attached to the button that was pressed.

## Notes

- To use modals when game is paused make sure the modal scene has the appropriate `process_mode` set.
- Nested modals are supported but not recommended as that is an anti-pattern.
- The screenshots show the default Godot theme but theming is completely under your control - the modals will use the theme of your project (or whatever theme is attached to the modal scene).
