//determine piece to be drawn from selected_piece input
draw_piece	be	draw_w_pawn	selected_piece	num1
		be	draw_w_rook	selected_piece	num2
		be	draw_w_knight	selected_piece	num3
		be	draw_w_bishop	selected_piece	num4
		be	draw_w_unicorn	selected_piece	num5
		be	draw_w_queen	selected_piece	num6
		be	draw_w_king	selected_piece	num7
		be	draw_b_pawn	selected_piece	num8
		be	draw_b_rook	selected_piece	num9
		be	draw_b_knight	selected_piece	num10
		be	draw_b_bishop	selected_piece	num11
		be	draw_b_unicorn	selected_piece	num12
		be	draw_b_queen	selected_piece	num13
		be	draw_b_king	selected_piece	num14
		be	draw_w_sqr	selected_piece	num0
//copy image starting address on SD for desired piece
draw_w_pawn	cp	sd_address_low	num18288
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_rook	cp	sd_address_low	num19488
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_knight	cp	sd_address_low	num17688
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_bishop	cp	sd_address_low	num16488
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_unicorn	cp	sd_address_low	num20088
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_queen	cp	sd_address_low	num18888
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_w_king	cp	sd_address_low	num17088
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_pawn	cp	sd_address_low	num14088
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_rook	cp	sd_address_low	num15288
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_knight	cp	sd_address_low	num13488
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_bishop	cp	sd_address_low	num12288
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_unicorn	cp	sd_address_low	num15888
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_queen	cp	sd_address_low	num14688
		cp	sd_address_high	num9
		be	draw_it		0		0

draw_b_king	cp	sd_address_low	num12888
		cp	sd_address_high	num9
		be	draw_it		0		0
//loop through the tile square, overwriting with image pixels
draw_it		cp	square_num	selected
		call 	square_to_xy	square_to_xy_return
		cp	vga_x1		square_x
		cp	vga_y1		square_y
		cp	draw_piece_xi	num0
		cp	draw_piece_yi	num0

draw_it_loop	call 	sd_read 	sd_return
		cp 	vga_color_write sd_data_read
		cp 	vga_x2 		vga_x1
		cp 	vga_y2 		vga_y1
		call 	vga_set_color 	vga_return
		add 	vga_x1 		vga_x1 		num1
		add 	sd_address_low 	sd_address_low 	num1
		add	draw_piece_xi	draw_piece_xi	num1
		blt 	draw_it_loop 	draw_piece_xi	num40

		add 	vga_y1 		vga_y1 		num1
		add	draw_piece_yi	draw_piece_yi	num1
		cp 	vga_x1 		square_x
		cp	draw_piece_xi	num0
		blt 	draw_it_loop 	draw_piece_yi	num15
		
		ret draw_piece_return
//overwrites previous location of piece with a white tile
draw_w_sqr	cp	square_num	selected
		call 	square_to_xy	square_to_xy_return
		cp	vga_x1		square_x
		cp	vga_y1		square_y
		cp	vga_color_write	num255
		add	vga_x2		vga_x1		num39
		add	vga_y2		vga_y1		num14
		call	vga_set_color	vga_return
		ret	draw_piece_return		

draw_piece_xi		.data 0
draw_piece_yi		.data 0
draw_piece_return	.data 0
