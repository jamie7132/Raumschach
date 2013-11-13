//REQ: get_piece_pos is a valid board position
//EFF: If get_piece_pos is empty, get_piece_isEmpty = 1, otherwise = 0.
//	If get_piece_pos is not empty, occupant and color are written.
//White := 0, Black := 1


//see if there is a piece at the position
get_piece		cpfa get_piece_value board_start get_piece_pos 
			bne get_piece_notEmpty get_piece_value num0
			cp get_piece_isEmpty num1
			ret get_piece_return

get_piece_notEmpty	cp get_piece_isEmpty num0
			cp get_piece_occupant get_piece_value

			//Check what color the piece is
			blt get_piece_white get_piece_occupant num8
			cp get_piece_color num1
			ret get_piece_return

get_piece_white		cp get_piece_color num0
			ret get_piece_return


//input variables
get_piece_pos 		.data 0
get_piece_return	.data 0

//output variables
get_piece_isEmpty 	.data 0
get_piece_occupant	.data 0
get_piece_color		.data 0

//local variables
get_piece_value		.data 0
