# screnshot_to_text
This repo is just to document the approaches suggested to directly hold images' recognized text to clipboard without a cumbersome process of pasting it in a local folder. 
A keyboard shortcut of Command + 8 can be used.

1) Open Automator and paste main.command content to a Quick Action script with no input as args.
2) need to navigate to the /tmp folder on your mac to place the .py
3) Need brew to install tesseract and use which tesseract to know the exact location of tesseract
4) Need which python to subsitute the correct python location

This is used in cases where a text is readable but not copyable - e.g. in a qbank situation, to make organizing files much easier and faster.