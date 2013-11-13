piece_eval           			cp 	get_piece_pos 			selected 					//Set get_piece input variable to the position selected
                     			call 	get_piece 			get_piece_return				//Call get_piece

piece_chooseeval					be 	piece_eval_end 			get_piece_occupant 	num0		//Go to piece_eval_end if space is empty
		             				be 	piece_eval_wpawn_check_eval 	get_piece_occupant 	num1		//Go to the corresponding label based on what piece is in the space
										be 	piece_eval_rook_check_eval 	get_piece_occupant 	num2
										be 	piece_eval_knight_check_eval 	get_piece_occupant 	num3
										be 	piece_eval_bish_check_eval 	get_piece_occupant	num4
										be 	piece_eval_uni_check_eval 	get_piece_occupant 	num5
										be 	piece_eval_queen_check_eval 	get_piece_occupant 	num6
										be 	piece_eval_king_check_eval 	get_piece_occupant 	num7
										be 	piece_eval_bpawn_check_eval 	get_piece_occupant 	num8
										be 	piece_eval_rook_check_eval 	get_piece_occupant 	num9
										be 	piece_eval_knight_check_eval 	get_piece_occupant 	num10
										be 	piece_eval_bish_check_eval 	get_piece_occupant 	num11
										be 	piece_eval_uni_check_eval 	get_piece_occupant 	num12
										be 	piece_eval_queen_check_eval 	get_piece_occupant 	num13
										be 	piece_eval_king_check_eval 	get_piece_occupant 	num14
							
piece_eval_uni_check_eval		cp 	boardpos 			selected								//Set the eval input variable to the position selected
                           	call 	unicorn_eval 			unicorn_eval_return			//Call the corresponding eval function
										be 	piece_eval_end 0 0										//Go to end
							
piece_eval_queen_check_eval	cp 	boardpos 			selected
										call 	queen_eval 			queen_eval_return
										be 	piece_eval_end 0 0
							
piece_eval_rook_check_eval		cp 	boardpos 			selected
										call 	rook_eval 			rook_eval_return
										be 	piece_eval_end 0 0
							
piece_eval_king_check_eval		cp 	boardpos 			selected
										call 	king_eval 			king_eval_return
										be 	piece_eval_end 0 0
							
piece_eval_bish_check_eval		cp 	boardpos 			selected
										call 	bishop_eval 			bishop_eval_return
										be 	piece_eval_end 0 0
							
piece_eval_wpawn_check_eval	cp 	boardpos 			selected
										call 	w_pawn_eval 			w_pawn_eval_return
										be 	piece_eval_end 0 0
							
piece_eval_bpawn_check_eval   cp 	boardpos 			selected
                              call 	b_pawn_eval 			b_pawn_eval_return
                              be 	piece_eval_end 0 0
                     							
piece_eval_knight_check_eval	cp 	boardpos 			selected
										call 	knight_eval 			knight_eval_return
							            
piece_eval_end                ret 	piece_eval_return										//Return

piece_eval_return             .data 0
