from template import template
from copy import deepcopy
import json

left_keys = ["q", "w", "e", "r", "t", "a", "s", "d", "f", "g", "z", "x", "c", "v", "b"]
right_keys = [
    "y",
    "u",
    "i",
    "o",
    "p",
    "open_bracket",
    "close_bracket",
    "h",
    "j",
    "k",
    "l",
    "semicolon",
    "quote",
    "backslash",
    "n",
    "m",
    "comma",
    "period",
    "slash",
]

left_mods = {
    "left_shift": "a",
    "left_control": "s",
    "left_alt": "d",
    "left_command": "f",
}
right_mods = {
    "right_shift": "semicolon",
    "right_control": "l",
    "right_alt": "k",
    "right_command": "j",
}

template_entry = template["manipulators"][0]
template["manipulators"] = []

for modifier, left_mod_key in left_mods.items():
    for right_key in right_keys:
        current_entry = deepcopy(template_entry)
        current_entry["from"]["simultaneous"] = [
            {"key_code": left_mod_key},
            {"key_code": right_key},
        ]
        current_entry["to_after_key_up"] = [
            {"key_code": right_key, "modifiers": modifier}
        ]
        template["manipulators"].append(current_entry)

for modifier, right_mod_key in right_mods.items():
    for left_key in left_keys:
        current_entry = deepcopy(template_entry)
        current_entry["from"]["simultaneous"] = [
            {"key_code": right_mod_key},
            {"key_code": left_key},
        ]
        current_entry["to_after_key_up"] = [
            {"key_code": left_key, "modifiers": modifier}
        ]
        template["manipulators"].append(current_entry)

arrows = {"h": "left_arrow", "j": "down_arrow", "k": "up_arrow", "l": "right_arrow"}

for key_name, arrow_name in arrows.items():
    current_entry = deepcopy(template_entry)
    current_entry["from"]["simultaneous"] = [
        {"key_code": "g"},
        {"key_code": key_name},
    ]
    current_entry["to_after_key_up"] = [{"key_code": arrow_name}]
    template["manipulators"].append(current_entry)


with open("karabiner_homerow_mods.json", "w") as fp:
    json.dump(template, fp)
