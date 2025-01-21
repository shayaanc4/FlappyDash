# FlappyJoyride
This project implements a Flappy Bird x Jetpack Joyride game on an FPGA platform using Verilog. The game is fully hardware-based and displayed via Video Graphics Array (VGA) to an external monitor at 640x480 resolution. A player controls the movement of the object through a switch on the FPGA board. The game implements score keeping, difficulty levels, and reset functionality.

•	Game Logic:

	•	Shape moving through an obstacle course.
	•	Player must avoid collision with the pillars.
	•	Automatic speedup as game goes on.
 
•	Custom Hardware Modules:

	•	VGA timing generator (vga_timing.v).
	•	Game clock divider (game_clock.v).
	•	Game logic controller (flappy_logic.v).
	•	Object drawing logic (draw_objects.v).
	•	7-Segment Display driver (HEXDisplayDriver.v)
	•	Top-level game controller (top_level_flappy.bdf)

 How to Run

	1.	Compile the Verilog modules and schematics using Quartus Prime (or another EDA of your choosing).
	2.	Connect and configure the DE0-CV FPGA board pins using the .qsf file.
	3.	Connect the VGA output to a monitor.
	4.	Use the input switch to control the object and enjoy the game!
