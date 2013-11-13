//Piece numbers:
//	White [1, 7]:
//		Pawns := 1
//		Rooks := 2
//		Knights := 3
//		Bishops:= 4
//		Unicorns:= 5
//		Queens := 6
//		King := 7
//		
//	Black [8, 14]:
//		Pawns := 8
//		Rooks := 9
//		Knights := 10
//		Bishops:= 11
//		Unicorns:= 12
//		Queens := 13
//		King := 14


//Resets the board
reset_board		cp reset_board_index num0
			cp playercolor num1 //reset to black which change_player will change to white and draw the square
			call change_player change_player_return //will change the player to white and color the turn square white
			cp dead_white_king num0 //make sure all kings are still alive
			cp dead_black_king num0

//puts all pieces back into the starting positions
reset_board_loop	cpta num0 board_start reset_board_index
			add reset_board_index reset_board_index num1
			blt reset_board_loop reset_board_index num125

			cpta num2 board_start num0
			cpta num4 board_start num1
			cpta num3 board_start num5
			cpta num5 board_start num6
			cpta num7 board_start num10
			cpta num6 board_start num11
			cpta num3 board_start num15
			cpta num4 board_start num16
			cpta num2 board_start num20
			cpta num5 board_start num21
			cpta num1 board_start num25
			cpta num1 board_start num26
			cpta num1 board_start num30
			cpta num1 board_start num31
			cpta num1 board_start num35
			cpta num1 board_start num36
			cpta num1 board_start num40
			cpta num1 board_start num41
			cpta num1 board_start num45
			cpta num1 board_start num46
			cpta num8 board_start num78
			cpta num8 board_start num79
			cpta num8 board_start num83
			cpta num8 board_start num84
			cpta num8 board_start num88
			cpta num8 board_start num89
			cpta num8 board_start num93
			cpta num8 board_start num94
			cpta num8 board_start num98
			cpta num8 board_start num99
			cpta num11 board_start num103
			cpta num9 board_start num104
			cpta num12 board_start num108
			cpta num10 board_start num109
			cpta num13 board_start num113
			cpta num14 board_start num114
			cpta num11 board_start num118
			cpta num10 board_start num119
			cpta num12 board_start num123
			cpta num9 board_start num124

			call draw_board draw_board_return //draw the board
			call draw_all_pieces draw_all_pieces_return //draw the pieces
			call	draw_mouse_skip	draw_mouse_return //draw the mouse

			be main_loop 0 0 //go back to start of game


reset_board_index	.data 0
reset_board_return	.data 0

board_start		.data 2 // white rook 1
			.data 4 // white bishop 1
			.data 0
			.data 0
			.data 0
			.data 3 // white knight 1
			.data 5 // white unicorn 1
			.data 0
			.data 0
		 	.data 0
		 	.data 7 // white king
		 	.data 6 // white queen 1
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 3 // white knight 2
		 	.data 4 // white bishop 2
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 2 // white rook 2
		 	.data 5 // white unicorn 2
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 1	//white pawn 1
		 	.data 1	//white pawn 2
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 1	//white pawn 3
		 	.data 1	//white pawn 4
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 1	//white pawn 5
		 	.data 1	//white pawn 6
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 1	//white pawn 7
		 	.data 1	//white pawn 8
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 1	//white pawn 9
		 	.data 1 //white pawn 10
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 8 //black pawn 1
		 	.data 8 //black pawn 2
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 8 //black pawn 3
		 	.data 8 //black pawn 4
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 8 //black pawn 5
		 	.data 8 //black pawn 6
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 8 //black pawn 7
		 	.data 8 //black pawn 8
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 8 //black pawn 9
		 	.data 8 //black pawn 10
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 11 //black bishop 1
		 	.data 9 //black rook 1
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 12 //black unicorn 1
		 	.data 10 //black knight 1
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 13 //black queen 1
		 	.data 14 //black king
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 11 //black bishop 2
		 	.data 10 //black knight 2
		 	.data 0
		 	.data 0
		 	.data 0
		 	.data 12 //black unicorn 2
		 	.data 9 //black rook 2
