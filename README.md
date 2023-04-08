# Tupper's Self-Referential Formula Visualizer

This Processing-based project allows users to interact with a scrolling graph of binary representations of numbers, inspired by Tupper's Self-Referential Formula. Users can draw, select, and modify the graph using keyboard and mouse inputs. The project consists of a main file (TUPPERWARE.pde) and two additional files (GRAPH.pde and DRAW.pde) that contain functions for drawing the grid, handling user interactions, and saving/loading sketches.

## Features

- Draw and modify binary representations of numbers on a grid
- Select and display a row of numbers in binary format
- Scroll through the graph vertically at varying speeds
- Save and load user drawings
- Display a scrolling graph based on the user's drawing

## Files

### TUPPERWARE.pde

The main file of the project that imports the BigInteger class from the java.math package and defines several variables and functions to manage the drawing and interaction with the graph. The file contains the `setup()`, `draw()`, `keyReleased()`, and `mouseWheel()` functions, which handle the initialization, main loop, keyboard inputs, and mouse wheel events, respectively.

### GRAPH.pde

This file contains two functions:

- `graph()`: Responsible for drawing a scrolling graph based on a series of numbers represented in binary.
- `gbox()`: Responsible for displaying a "Draw >" button on the right side of the screen, allowing users to select a row of numbers and display it in binary format.

### DRAW.pde

This file contains functions for drawing the grid, handling user interactions, and saving/loading sketches:

- `drawing()`: Handles the drawing of the grid and updates it based on user input.
- `dbox()`: Handles the generation of the graph based on the user's drawing and other user interface elements.
- `saves()`: Handles saving and loading of user drawings.
- `savestring()`: Saves the current sketches to a text file.

## How to Use

1. Install [Processing](https://processing.org/download/) for your platform.
2. Download or clone this repository.
3. Open the TUPPERWARE.pde file in the Processing IDE.
4. Run the program by clicking the "Run" button or pressing `Ctrl + R` (`Cmd + R` on macOS).

When the program launches, you can draw on the grid using your mouse. Use the keyboard shortcuts to interact with the graph:

- Space: Toggle between drawing mode and scrolling graph mode.
- C: Clear the entire grid.
- S: Switch between binary and decimal representations.
- I: Invert the current grid.
- B: Increase the stroke size.
- -: Decrease the stroke size.

In scrolling graph mode, use the mouse wheel to scroll vertically through the graph. Click the "Draw >" button to display the selected row of numbers in binary format.

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).
