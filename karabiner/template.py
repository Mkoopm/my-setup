template = {
    "description": "Pressing the tab,q keys simultaneously launches Mission Control (key_down_order)",
    "manipulators": [
        {
            "type": "basic",
            "from": {
                "simultaneous": [{"key_code": "h"}, {"key_code": "c"}],
                "simultaneous_options": {
                    "detect_key_down_uninterruptedly": True,
                    "key_down_order": "strict",
                    "key_up_order": "strict_inverse",
                    "key_up_when": "any",
                },
                "modifiers": {"optional": ["any"]},
            },
            "to_after_key_up": [{"key_code": "c", "modifiers": "left_command"}],
        }
    ],
}
