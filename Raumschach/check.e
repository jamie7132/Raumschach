//Set the color of the king you want to find to kingcolor. The corresponding variable (either white_king_incheck or black_king_incheck, not both)) will update. 0 means not in check. 1 means in check.


check 			      cp saveplayercolor playercolor					//Save which player's turn it is
                     cp kingpos num0										//Resets a variety of variables
                     cp kingcolor num0
							cp check_piece num0
							cp board_check_index	num0
							cp check_piece_index num0		
							cp incheck_index num0	
							cp possibly_king num0	
							cp incheck_move num0	
							cp white_king_incheck num0
							cp black_king_incheck num0

find_wking_loop		be not_checkw board_check_index num125					//if king is not found in the board, the king is not in check		
                     cpfa possibly_king board_start board_check_index	//place the piece value of the board at the current index in a temp variable
							add board_check_index board_check_index num1			//enumerate the index of the board
							bne find_wking_loop possibly_king num7					//If the piece value in the temp variable is not the white king - loop

set_wking_pos        sub kingpos board_check_index num1						//Remember the index of where the white king is
                     cp playercolor num1											//Temporarily set playercolor to black, in order to correctly use the eval functions

look_for_black		   be not_checkw check_piece_index num125					//If the index reaches 125, the white king is not in check
                     cpfa check_piece board_start check_piece_index		//Set the piece value of the board position to a temp variable
							add check_piece_index check_piece_index num1			//Enumerate the index
							be look_for_black check_piece num0						//Loop if the piece value in the temp variable is empty
							blt look_for_black check_piece num8						//If the piece is white, loop
							
chooseeval				be wpawn_check_eval check_piece num1					//Go to the label that matches corresponding value of the piece found
							be rook_check_eval check_piece num2
							be knight_check_eval check_piece num3
							be bish_check_eval check_piece num4
							be uni_check_eval check_piece num5
							be queen_check_eval check_piece num6
							be king_check_eval check_piece num7
							be bpawn_check_eval check_piece num8
							be rook_check_eval check_piece num9
							be knight_check_eval check_piece num10
							be bish_check_eval check_piece num11
							be uni_check_eval check_piece num12
							be queen_check_eval check_piece num13
							be king_check_eval check_piece num14
							
uni_check_eval			sub boardpos check_piece_index num1						//Set the position of the piece (Unicorn)
                     call unicorn_eval unicorn_eval_return					//Call the piece's eval function
							be incheck_reset num0 num0									//Go to incheck_reset
							
queen_check_eval		sub boardpos check_piece_index num1						//Queen
                     call queen_eval queen_eval_return
							be incheck_reset num0 num0
							
rook_check_eval		sub boardpos check_piece_index num1						//Rook
                     call rook_eval rook_eval_return
							be incheck_reset num0 num0
							
king_check_eval		sub boardpos check_piece_index num1						//King
                     call king_eval king_eval_return
							be incheck_reset num0 num0
							
bish_check_eval		sub boardpos check_piece_index num1						//Bishop
                     call bishop_eval bishop_eval_return
							be incheck_reset num0 num0
							
wpawn_check_eval		sub boardpos check_piece_index num1						//White pawn
                     call w_pawn_eval w_pawn_eval_return
							be incheck_reset num0 num0
							
bpawn_check_eval     sub boardpos check_piece_index num1						//Black pawn
                     call b_pawn_eval b_pawn_eval_return
                     be incheck_reset num0 num0
                     							
knight_check_eval		sub boardpos check_piece_index num1						//Knight
                     call knight_eval knight_eval_return
							be incheck_reset num0 num0

incheck_reset        cp incheck_index num0									//Reset the incheck_index
incheck					cpfa incheck_move possible_moves incheck_index	//Place a possible move of the current piece to a temp variable
							be confirmed_checkw incheck_move kingpos			//Check if this possible move is at the king's position
							add incheck_index incheck_index num1				//Enumerate the index
							blt incheck incheck_index possible_moves_size	//Loop as long as you have not read all of the piece's possible moves
							be look_for_black kingcolor num0						//If the this piece cannot attack the king, go back to the corresponding look_for_color label
							be look_for_white kingcolor num1

find_bking_loop		be check_esc board_check_index num125					//Look for black king
                     cpfa possibly_king board_start board_check_index
							add board_check_index board_check_index num1
							bne find_bking_loop possibly_king num14
set_bking_pos        sub kingpos board_check_index num1						//Set black king position
                     cp playercolor num0
							
look_for_white			be check_esc check_piece_index num125					//Look for white pieces that can attack king
                     cpfa check_piece board_start check_piece_index
							add check_piece_index check_piece_index num1
							be look_for_white check_piece num0
							blt chooseeval check_piece num8
							be look_for_white num0 num0
							
not_checkw           cp kingcolor num1											//If the white king is not in check, change the kingcolor to black
                     cp board_check_index num0								//Reset the indices
                     cp check_piece_index num0
                     be find_bking_loop num0 num0							//Go to the loop to find the black king

confirmed_checkw		be confirmed_checkb kingcolor	num1					//Go to confirmed_checkb if the kingcolor is black
							cp white_king_incheck num1								//Indicate that the white king is in check
							cp board_check_index num0								//Reset indices
                     cp check_piece_index num0
                     cp kingcolor num1											//Change the king color to black
							be find_bking_loop num0 num0							//Go to the find_bking_loop

confirmed_checkb		cp black_king_incheck num1								//Indicate that the black king is in check
							be check_esc num0 num0									//Go to the return

check_esc 			   cp playercolor saveplayercolor						//Set the playercolor back to it's original value
                     ret check_return											//Return

check_return			.data 0
kingcolor				.data 0
kingpos					.data 0
check_piece				.data 0
board_check_index		.data 0
check_piece_index		.data 0
incheck_index			.data 0
possibly_king			.data 0
incheck_move			.data 0
saveplayercolor      .data 0
white_king_incheck	.data 0
black_king_incheck	.data 0
