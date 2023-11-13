# Godotshapon
A game designed to be a motivational detour for my blender modeling!

<img width="953" alt="Screenshot 2023-11-12 at 9 07 27 PM" src="https://github.com/ChristopherSartin/Godotshapon/assets/23038176/37cd074e-f924-4dbe-9a59-402a4d5c02f2">

Controls:\
  Click "Slots" to get a random model\
  Click "Collection" to view a list of the models you've already won\
  Click any model with a visible image to open it in model view\
  When previewing a model after playing slots or vieiwng a model in your collection:
  -  WASD - Rotate the Model
  -  SPACE - Reset Orientation
    
Planned Features:
- External model integration:
  - Currently you have to import glTF files into Godot and re-build to add new models. Eventually the plan is to have an external file location that allows adding in assets exported form a separate godot application to reduce rebuilds required
- Game Juice/Grapical Upgrades:
  - Just general improvements to game feel
- Options:
  - Clear data options as well as sound options will be added
- Extra Information:
  - Descriptions, dates, and other information are already stored in meta files, but these are currently not displayed

If you want to add more models:
  - Add a folder into res://assets/models
  - Add in glTF or glb Model and a png image for model and icon respectively
  - Open res://utility/model_formatter scene
  - Drag glTF/glb under ModelAdjustmentNode and resize roughly to ModelSizingReference
  - Fill out model_json_formatter on the Root node
    - File Name is the glTF/glb name (with extension)
    - Icon Name is the image name (with extension)
    - Model Path is where the folder is located (res://assets/models/your_file_name)
    - All other data is up to your discression
  - Click the checkbox labeld "Button Save to File"
  - Run the program and insure it works!

If you have any questions hit me up at christopher.daniel.sartin@gmail.com
