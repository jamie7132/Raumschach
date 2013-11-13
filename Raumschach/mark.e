//place a blue highlight on tile of selected piece
mark_on		cp	mark_index	num0
		cp	square_num	selected
		call	square_to_xy	square_to_xy_return
		cp	vga_color_write	num3
		cp	vga_x1		square_x
		cp	vga_y1		square_y
		add	vga_x2		vga_x1			num6
		add	vga_y2		vga_y1			num6
		call	vga_set_color	vga_return
		blt	mark_moves	num0			possible_moves_size
		ret	mark_return
//place a red highlight on tiles of possible moves for piece
mark_moves	cpfa	square_num	possible_moves		mark_index
		call	square_to_xy	square_to_xy_return
		cp	vga_color_write	num224
		cp	vga_x1		square_x
		cp	vga_y1		square_y
		add	vga_x2		vga_x1			num6
		add	vga_y2		vga_y1			num6
		call	vga_set_color	vga_return
		add	mark_index	mark_index		num1
		blt	mark_moves	mark_index		possible_moves_size
		ret	mark_return
//remove highlights upon any new tile click
mark_off	cp	mark_index	num0
mark_none	cp	square_num	mark_index
		call	square_to_xy	square_to_xy_return
		cp	vga_color_write	num255
		cp	vga_x1		square_x
		cp	vga_y1		square_y
		add	vga_x2		vga_x1			num6
		add	vga_y2		vga_y1			num6
		call	vga_set_color	vga_return
		add	mark_index	mark_index		num1
		blt	mark_none	mark_index		num125
		ret	mark_return

mark_index	.data	0
mark_return	.data	0
