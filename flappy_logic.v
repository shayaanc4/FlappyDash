module flappy_logic(clk, reset, SW, ball_y, pillar_x, pillar_y, score);

// Constants regarding sizes of the screen and objects
parameter ACTIVE_WIDTH = 640; //screen width
parameter ACTIVE_HEIGHT = 480; //screen height
parameter BALL_WIDTH = 10;
parameter BALL_HEIGHT = 10;
parameter PILLAR_WIDTH = 50;
parameter PILLAR_HEIGHT = 80; //pillar gap width

parameter BALL_X = ACTIVE_WIDTH/3;
parameter py1 = 15, py2 = 220, py3 = 350, py4 = 270, py5 = 60, py6 = 150, py7 = 40, py8 = 30, py9 = 120, py10 = 80; //values used for pillar_y
parameter BALL_SPEED = 5;

// I/O declarations
input clk, reset;
input [9:0] SW;
output reg [9:0] ball_y, pillar_x, pillar_y; //Note: pillar_y refers to gap position
output reg [7:0] score;
reg [10:0] ctr;

initial pillar_y = py1;

reg [8:0] PILLAR_SPEED;
initial PILLAR_SPEED = 5;

wire signed [3:0] ball_dy;


// Assigning ball movemen to switch input
assign ball_dy = SW[0] ? -BALL_SPEED : BALL_SPEED;

// Ball movement
always@(posedge clk or posedge reset) begin
	// Resetting the game environment
	if (reset) begin
	  ball_y <= ACTIVE_HEIGHT / 2;
	  ctr <= 0;
	  score <= 0;
	  pillar_x <= ACTIVE_WIDTH; 
	end
	
	// When not resetting
   else begin
		
		// Updating ball position based on velocities
		
		if (ball_y < ACTIVE_HEIGHT-BALL_HEIGHT && ball_dy == BALL_SPEED) begin
			ball_y <= $signed({1'b0, ball_y}) + ball_dy;
		end
		
		if (ball_y > 0 && ball_dy == -BALL_SPEED) begin
			ball_y <= $signed({1'b0, ball_y}) + ball_dy;
		end
	

		// Resetting score and positions when ball collides w pillar
		if (BALL_X >= pillar_x && BALL_X <= pillar_x + PILLAR_WIDTH) begin
			if (ball_y <= pillar_y || ball_y >= pillar_y + PILLAR_HEIGHT) begin
				ctr <= 0;
				score <= 0;
				ball_y <= ACTIVE_HEIGHT/2;
				PILLAR_SPEED <= 5;
				pillar_x <= ACTIVE_WIDTH;
			end 
			else begin
				ctr <= ctr + 1;
				if (pillar_x >= PILLAR_SPEED) begin
					pillar_x <= pillar_x - PILLAR_SPEED;
				end
			end
		end
		
		
		else begin
			if (pillar_x >= PILLAR_SPEED) begin
				pillar_x <= pillar_x - PILLAR_SPEED;
			end
			
		end
		
		//changing pillar gap position whenever the pillar goes off screen
		if (pillar_x <= PILLAR_SPEED) begin
			pillar_x <= ACTIVE_WIDTH;
			case (pillar_y)                 
				py1: pillar_y <= py2;
				py2: pillar_y <= py3;
				py3: pillar_y <= py4;
				py4: pillar_y <= py5;
				py5: pillar_y <= py6;
				py6: pillar_y <= py7;
				py7: pillar_y <= py8;
				py8: pillar_y <= py9;
				py9: pillar_y <= py10;
				py10: pillar_y <= py1;
			endcase
		end
		
		//increasing movement speed and score whenever the ball passes through the pillar
		
		if (ctr == PILLAR_WIDTH/PILLAR_SPEED) begin
			score <= score + 1;
			ctr <= 0;
			PILLAR_SPEED <= PILLAR_SPEED + 1;
		end
	end
end



endmodule
