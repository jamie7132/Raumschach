//Prints the victory screen for when white wins

//Set the sd address to where the white image is stored
white_victory	cp	sd_address_high	num19
		cp	sd_address_low 	num208
		cp	vga_x1 		num0
		cp	vga_y1 		num0

//Loop that reads the image from the sd card and prints it to the VGA
//One line at a time
white_vic_loop	call 	sd_read 	sd_return
		cp 	vga_color_write	sd_data_read
		cp 	vga_x2 		vga_x1
		cp 	vga_y2 		vga_y1
		call 	vga_set_color 	vga_return
		add 	vga_x1 		vga_x1 		num1
		add 	sd_address_low 	sd_address_low 	num1
		blt 	w_incr_addr 	sd_address_low 	num0
		blt 	w_incr_addr 	num32767	sd_address_low
white_back	blt 	white_vic_loop 	vga_x1 		num640 //check for end of line

//Increase the row and reset column
		add 	vga_y1 		vga_y1 		num1
		cp 	vga_x1 		num0
		blt 	white_vic_loop 	vga_y1 		num480

		ret 	white_victory_return

//Reset the low address to 0 and increase the high address
w_incr_addr	add 	sd_address_high sd_address_high num1
		cp 	sd_address_low 	num0
		be 	white_back 	0 		0

white_victory_return	.data 0
