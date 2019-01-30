// testgen_tb.vt
//
// Testbench for testgen.v
//
// 2018/04/23  Written (BB)

`timescale 1ns/10ps

module comb_ckt_generator_tb;

//----- Declarations
reg [9:0]	count;
wire  [3:0]         redo;
wire  [3:0]         greeno;
wire [3:0]         blueo;
wire [9:0]				coly;
wire [8:0] 				rowy;
reg [1:0] 				sw;

reg[3:0] inb3=4'b0111;
reg[3:0]	inb2=4'b1100;
reg[3:0]	inb1=4'b0111;
reg[3:0]	ing3=4'b1001;
reg[3:0]	ing2=4'b1011;
reg[3:0]	ing1=4'b0111;
reg[3:0]	inr3=4'b1110;
reg[3:0]	inr2=4'b1111;
reg[3:0]	inr1=4'b0111;
reg[3:0]	inl3=4'b1001;
reg[3:0]	inl2=4'b1101;
reg[3:0]	inl1=4'b1000;


wire  [3:0] r3;
wire  [3:0] r2;
wire  [3:0] r1;
wire  [3:0] b3;
wire  [3:0] b2;
wire  [3:0] b1;
wire  [3:0] g3;
wire  [3:0] g2;
wire  [3:0] g1;
wire  [3:0] l3;
wire  [3:0] l2;
wire  [3:0] l1;


//----- testgen submodule
 comb_ckt_generator comb_ckt_generator1 (
	.SW			(inb3),
	.col			(inb2),
	.row			(inb1),
   .red       (b3),
   .green       (b2),
   .blue       (b1)
   );
comb_ckt_generator comb_ckt_generator2 (
	.SW			(ing3),
	.col			(ing2),
	.row			(ing1),
   .red       (g3),
   .green       (g2),
   .blue       (g1)
   );
comb_ckt_generator comb_ckt_generator3 (
	.SW			(inr3),
	.col			(inr2),
	.row			(inr1),
   .red       (r3),
   .green       (r2),
   .blue       (r1)
   );
comb_ckt_generator comb_ckt_generator4 (
	.SW			(inl3),
	.col			(inl2),
	.row			(inl1),
   .red       (l3),
   .green       (l2),
   .blue       (l1)
   );

initial begin
 
   $write("Beginning simulation\n");
	
	
		
			#10
			$write("inputA = %b, ", inb3);
			$write("inputB = %b, ", inb2);
			$write("inputC = %b, ", inb2);
			$write("green = %b, ", b3);
			$write("blue = %b, ", b2);
			$write("red = %b, ", b1);
			$write("\n");
			
			

			#10
			$write("inputA = %b, ", ing3);
			$write("inputB = %b, ", ing2);
			$write("inputC = %b, ", ing1);
			$write("green = %b, ", g3);
			$write("blue = %b, ", g2);
			$write("red = %b, ", g1);
			$write("\n");
			
			
	
			#10
			$write("inputA = %b, ", inr3);
			$write("inputB = %b, ", inr2);
			$write("inputC = %b, ", inr1);
			$write("green = %b, ", r3);
			$write("blue = %b, ", r2);
			$write("red = %b, ", r1);
			$write("\n");
			
			
			#10
			$write("inputA = %b, ", inl3);
			$write("inputB = %b, ", inl2);
			$write("inputC = %b, ", inl1);
			$write("green = %b, ", l3);
			$write("blue = %b, ", l2);
			$write("red = %b, ", l1);
			$write("\n");
			

	 
   $finish;             // ends simulation
end

endmodule

