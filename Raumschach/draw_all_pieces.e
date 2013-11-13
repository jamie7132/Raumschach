//loops through board array and call draw_piece at each tile
draw_all_pieces		cp 	draw_a_p_index 	num0
draw_a_p_loop		cp 	selected 	draw_a_p_index
			cpfa	selected_piece	board_start	draw_a_p_index
			call	draw_piece	draw_piece_return
			add	draw_a_p_index	draw_a_p_index	num1
			blt	draw_a_p_loop	draw_a_p_index	num125

			ret	draw_all_pieces_return

draw_a_p_index		.data 0
draw_all_pieces_return	.data 0
