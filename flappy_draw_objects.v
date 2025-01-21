module flappy_draw_objects(r, g, b, x, y, ball_y, pillar_x,  pillar_y);

	// Constants regarding sizes of the screen and objects
	parameter ACTIVE_WIDTH = 640;
	parameter ACTIVE_HEIGHT = 480;
	parameter BALL_WIDTH = 10;
	parameter BALL_HEIGHT = 10;
	parameter PILLAR_WIDTH = 50;
	parameter PILLAR_HEIGHT = 80;
	parameter BALL_X = ACTIVE_WIDTH/3;
	                                                                                                                              
	// I/O declarations
	input [9:0] x, y, ball_y, pillar_x, pillar_y;                                                 
	output reg [3:0] r,g,b;
	
	// Drawing at every pixel (x,y) in the current frame
	always@* begin
		// Drawing the ball 
		if (x >= BALL_X && x < BALL_X + BALL_WIDTH && y >= ball_y && y < ball_y + BALL_HEIGHT) begin
			r <= 4'd15;
			g <= 4'd15;
			b <= 4'd15;
		end
		
		else if ((x >= pillar_x && x < pillar_x + PILLAR_WIDTH) && (y <= pillar_y || y >= pillar_y + PILLAR_HEIGHT)) begin
			r <= 4'd15;
			g <= 4'd15;
			b <= 4'd15;
		
		// Drawing the background
		end else begin
			r <= 4'd0;
			g <= 4'd0;
			b <= 4'd0;
		end
	end
endmodule
