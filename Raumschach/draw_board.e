//Board image is first image loaded onto SD
//start reading SD memory from start
draw_board	cp sd_address_high num0
		cp sd_address_low num0
		cp vga_x1 num0
		cp vga_y1 num0
//loop through entire screen, changing pixels to that of image
draw_loop	call sd_read sd_return
		cp vga_color_write sd_data_read
		cp vga_x2 vga_x1
		cp vga_y2 vga_y1
		call vga_set_color vga_return
		add vga_x1 vga_x1 num1
		add sd_address_low sd_address_low num1
		blt incr_addr sd_address_low num0
		blt incr_addr num32767	sd_address_low
draw_back	blt draw_loop vga_x1 num640

		add vga_y1 vga_y1 num1
		cp vga_x1 num0
		blt draw_loop vga_y1 num480

		cp vga_x1 num0
		cp vga_y1 num40
		cp vga_x2 num110
		cp vga_y2 num80
		cp vga_color_write num0
		call vga_set_color vga_return

		cp vga_x1 num1
		cp vga_y1 num41
		cp vga_x2 num109
		cp vga_y2 num79
		cp vga_color_write num255
		call vga_set_color vga_return

		ret draw_board_return
//increment SD address by 1
incr_addr	add sd_address_high sd_address_high num1
		cp sd_address_low num0
		be draw_back 0 0

draw_board_return	.data 0
