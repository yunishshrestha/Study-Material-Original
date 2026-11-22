{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build Graphics Program",
            "type": "shell",
            "command": "gcc",
            "args": [
                "-o",
                "analog_clock",
                "analog_clock.c",
                "-lbgi",
                "-lgdi32",
                "-lcomdlg32",
                "-luuid",
                "-loleaut32",
                "-lole32"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": ["$gcc"],
            "detail": "Generated task for compiling graphics programs."
        }
    ]
}

