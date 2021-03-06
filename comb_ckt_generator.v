//============================================================================
// comb_ckt_generator.v
//
// This code is generated by Terasic System Builder
// and modified by M. Hildebrand and B. Baas
//
// 2018/02/05 First version
// 2018/04/24 Routed all board-level switches and LEDs to and from this module
//============================================================================

module comb_ckt_generator (
   // VGA-related signals
   col,
   row,
   red,
   green,
   blue,
   // input push buttons and switches
   KEY,
   SW,
   // output LEDs and 7-segment displays
   LEDR,
   HEX0,
   HEX1,
   HEX2,
   HEX3,
   HEX4,
   HEX5
   );

input  [9:0]  col;
input  [8:0]  row;
output [3:0]  red;    // 4-bit color output
output [3:0]  green;  // 4-bit color output
output [3:0]  blue;   // 4-bit color output

// input push buttons and switches
input  [1:0]  KEY;    // two board-level push buttons KEY1 - KEY0
input  [9:0]  SW;     // ten board-level switches SW9 - SW0

// output LEDs and 7-segment displays
output [9:0]  LEDR;   // ten board-level LEDs LEDR9 - LEDR0
output [7:0]  HEX0;   // board-level 7-segment display
output [7:0]  HEX1;   // board-level 7-segment display
output [7:0]  HEX2;   // board-level 7-segment display
output [7:0]  HEX3;   // board-level 7-segment display
output [7:0]  HEX4;   // board-level 7-segment display
output [7:0]  HEX5;   // board-level 7-segment display


//============================================================================
//  reg/wire declarations
//============================================================================
// More complex implementations will likely declare RGB outputs as regs
// rather than wires
reg [3:0]    red, green, blue;    


//============================================================================
// Board-LED related circuits
//============================================================================

// Temporary simple logic
// The 10 LEDs will light depending on the position of the adjacent 10 switches
assign LEDR = SW;      // ten LEDs assigned to ten switches

// Temporary simple logic
// This block sets the 7-segment HEX displays
// HEX4 - HEX0 are set to all dark
// HEX5 lights segments based on SW9 - SW2
assign HEX0 = 8'b1111_1111;
assign HEX1 = 8'b1111_1111;
assign HEX2 = 8'b1111_1111;
assign HEX3 = 8'b1111_1111;
assign HEX4 = 8'b1111_1111;
assign HEX5 = ~{SW[9], SW[8], SW[7], SW[6], SW[5], SW[4], SW[3], SW[2]};


//==============================================================
// VGA display related circuits
//==============================================================

// Temporary simple logic
// Full intensity is SW[0] is '1'. Blank otherwise


reg [3:0] redback;
reg [3:0] blueback;
reg [3:0] greenback;

reg [3:0] tgreeny;
reg[3:0] tbluey;
reg [3:0] treddy;

reg[3:0] t1blue;
reg[3:0] t1red;
reg[3:0] t1green;

reg [9:0] xmin;
reg [9:0] xmax;
reg [8:0] ymin;
reg [8:0] ymax;

reg [9:0] xmin2;
reg [9:0] xmax2;
reg [8:0] ymin2;
reg [8:0] ymax2;


/*
286=10'b0100011110
319=10'b0100111111
206=9'b011001110
239=9'b011101111
271=9'b100001111
351=10'b0101011111
*/

always@(*)begin
case(SW[3:2])
2'b00: begin redback=4'b0000; greenback=4'b0000; blueback=4'b0000;end
2'b01: begin redback=4'b1000; greenback=4'b1000; blueback=4'b1000;end
2'b10: begin redback=4'b0010; greenback=4'b0100; blueback=4'b0111;end
2'b11: begin redback=4'b1110; greenback=4'b1011; blueback=4'b0010;end	
endcase
green=greenback;
blue=blueback;
red=redback;

case(SW[9:8])
2'b00: begin xmin=10'b0100011110; xmax=10'b0100111111; ymin=9'b011101111; ymax=9'b100001111;end //286,319,239,271
2'b01: begin xmin=10'b0100011110; xmax=10'b0100111111; ymin=9'b011001110; ymax=9'b011101111;end //286,319,206,239
2'b10: begin xmin=10'b0100111111; xmax=10'b0101011111; ymin=9'b011101111; ymax=9'b100001111;end //319,351,239,271
2'b11: begin xmin=10'b0100111111; xmax=10'b0101011111; ymin=9'b011001110; ymax=9'b011101111;end //319,351,206,239
endcase



case(SW[1:0])
1'b0: begin xmin2=10'b0000000000; xmax2=10'b1010000000; ymin2=9'b000000000; ymax2=9'b000100000;end //0,640,0,32
1'b1: begin xmin2=10'b0000000000; xmax2=10'b1010000000; ymin2=9'b111000000; ymax2=9'b111100000;end //0,640,448,480
endcase

if(SW[0]==1)begin
	if((col>=xmin2)&&(col<=xmax2)&&(row>=ymin2)&&(row<=ymax2))begin
	green=tgreeny;
	red=treddy;
	blue=tbluey;
			if(SW[7]==1)begin
					treddy=4'b1111;
					end
					else begin
					treddy=4'b0000;
					end
			if(SW[6]==1)begin
					tgreeny=4'b1111;
					end
					else begin
					tgreeny=4'b0000;
					end
			if(SW[5]==1)begin
					tbluey=4'b1111;
					end
					else begin
					tbluey=4'b0000;
					end
			
	
	end
end



if((col>=xmin)&&(col<=xmax)&&(row>=ymin)&&(row<=ymax))begin
			green=t1green;
			blue=t1blue;
			red=t1red;
			
			if(SW[4]==1)begin	
			
				if((col>=xmin+1)&&(col<=xmax-1)&&(row>=ymin+1)&&(row<=ymax-1))begin
						green=greenback;
						red=redback;
						blue=blueback;
					end
			end	
			
			if(SW[7]==1)begin
					t1red=4'b1111;
					end
					else begin
					t1red=4'b0000;
					end
			if(SW[6]==1)begin
					t1green=4'b1111;
					end
					else begin
					t1green=4'b0000;
					end
			if(SW[5]==1)begin
					t1blue=4'b1111;
					end
					else begin
					t1blue=4'b0000;
					end
			
			
end





		
		/*
			if(SW[4]==1)begin
					case(SW[9:8])
					2'b00: begin xmin=10'b0100011110; xmax=10'b0100111111; ymin=9'b011001110; ymax=9'b011101111;end
					2'b01: begin xmin=10'b0100011110; xmax=10'b0100111111; ymin=9'b011101111; ymax=9'b100001111;end
					2'b10: begin xmin=10'b0100111111; xmax=10'b0101011111; ymin=9'b011001110; ymax=9'b011101111;end
					2'b11: begin xmin=10'b0100111111; xmax=10'b0101011111; ymin=9'b011101111; ymax=9'b100001111;end
					endcase
				
					
			end
			*/


end

endmodule
