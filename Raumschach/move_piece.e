//After a move is chosen, the board array is changed using this function. 
//Input: boardpos (the position of the piece moving), movepos (where the piece is moving)

move_piece		cpfa move_piece_value board_start boardpos
			cpta num0 board_start boardpos
			be move_piece_wq_chk move_piece_value num1
			be move_piece_bq_chk move_piece_value num8

move_piece_write	cpta move_piece_value board_start movepos
			ret move_piece_return

move_piece_wq_chk	be move_piece_w_chng movepos num104
			be move_piece_w_chng movepos num109
			be move_piece_w_chng movepos num114
			be move_piece_w_chng movepos num119
			be move_piece_w_chng movepos num124
			be move_piece_write 0 0

move_piece_bq_chk	be move_piece_b_chng movepos num0
			be move_piece_b_chng movepos num5
			be move_piece_b_chng movepos num10
			be move_piece_b_chng movepos num15
			be move_piece_b_chng movepos num20
			be move_piece_write 0 0

move_piece_w_chng	cp move_piece_value num6
			be move_piece_write 0 0

move_piece_b_chng	cp move_piece_value num13
			be move_piece_write 0 0

move_piece_value	.data 0
move_piece_return	.data 0
