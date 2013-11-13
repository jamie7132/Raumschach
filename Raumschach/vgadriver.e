//Changes the rectangle (x1, y1) to (x2, y2) to a certain color
//Set command parameters and turn the command signal to 1

vga_set_color	cp vga_command num1
		cp vga_write num1

vga_check1	blt vga_check2 vga_x1 vga_x2
		cp vga_x2 vga_x1

vga_check2	blt vga_set_param vga_y1 vga_y2
		cp vga_y2 vga_y1

vga_set_param	out 62 vga_write
		out 63 vga_x1
		out 64 vga_y1
		out 65 vga_x2
		out 66 vga_y2
		out 67 vga_color_write
		out 60 vga_command

//Wait for the VGA display to signal that the command has processed
vga_wait1	in 61 vga_response
		bne vga_wait1 vga_response num1

//Read in pixel color if func called was vga_read
		bne vga_branch vga_write num0
		in 68 vga_color_read

//change command signal to 0		
vga_branch	cp vga_command num0
		out 60 vga_command

//Wait for the VGA display to change response signal to 0
vga_wait2	in 61 vga_response
		bne vga_wait2 vga_response num0

//Go back to where device driver was called from
vgad_return	ret vga_return


//Reads the color of the pixel (x1, y1)
//Set command parameters and turn the command signal to 1
vga_read	cp vga_command num1
		cp vga_write num0
		out 62 vga_write
		out 63 vga_x1
		out 64 vga_y1
		out 60 vga_command

//Finish rest of procedures as outlined above
		be vga_wait1 0 0


vga_command	.data	0
vga_response	.data	0
vga_write	.data	0
vga_x1		.data	0
vga_y1		.data	0
vga_x2		.data	0
vga_y2		.data	0
vga_color_write	.data	0
vga_color_read	.data	0
vga_return	.data	0
