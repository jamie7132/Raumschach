//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.

b_pawn_eval    		cp possible_moves_size num0
                        cp border_pos boardpos
                        call border_check border_check_return //go through permissions and border checking

//Go through and make sure it can move forward						
b_pawn_for_check        be b_pawn_down_check for_permission num0 //go to next way to move if border check limits this move direction
                        cp b_pawn_eval_move boardpos  
                        sub b_pawn_eval_move b_pawn_eval_move num25                          
                        cp get_piece_pos b_pawn_eval_move 
                        call get_piece get_piece_return
                        bne b_pawn_down_check get_piece_isEmpty num1 //If not empty (pawn can't capture in this direction), look at next possibility
			cpta b_pawn_eval_move possible_moves possible_moves_size                                    
                        add possible_moves_size possible_moves_size num1

//Pretty much same as for_check except for moving down                         
b_pawn_down_check       be b_pawn_dr_check down_permission num0
                        cp b_pawn_eval_move boardpos
                        sub b_pawn_eval_move b_pawn_eval_move num1
                        cp get_piece_pos b_pawn_eval_move
                        call get_piece get_piece_return
                        bne b_pawn_dr_check get_piece_isEmpty num1
			cpta b_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
//Capture directions logic:
b_pawn_dr_check         be b_pawn_dl_check dr_permission num0
                        cp b_pawn_eval_move boardpos
                        add b_pawn_eval_move b_pawn_eval_move num4
                        cp get_piece_pos b_pawn_eval_move
                        call get_piece get_piece_return
                        be b_pawn_dl_check get_piece_isEmpty num1 //There must be a piece in this position
                        be b_pawn_dl_check playercolor get_piece_color //The piece there cannot be the same color                 
        		cpta b_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

b_pawn_dl_check         be b_pawn_fr_check dl_permission num0
                        cp b_pawn_eval_move boardpos
                        sub b_pawn_eval_move b_pawn_eval_move num6
                        cp get_piece_pos b_pawn_eval_move
                        call get_piece get_piece_return
                        be b_pawn_fr_check get_piece_isEmpty num1
                        be b_pawn_fr_check playercolor get_piece_color                        
		        cpta b_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
b_pawn_fr_check         be b_pawn_fl_check fr_permission num0
                        cp b_pawn_eval_move boardpos
                        sub b_pawn_eval_move b_pawn_eval_move num20
                        cp get_piece_pos b_pawn_eval_move
                        call get_piece get_piece_return
                        be b_pawn_fl_check get_piece_isEmpty num1
                        be b_pawn_fl_check playercolor get_piece_color                        
		        cpta b_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

b_pawn_fl_check         be b_pawn_return fl_permission num0
                        cp b_pawn_eval_move boardpos
                        sub b_pawn_eval_move b_pawn_eval_move num30
                        cp get_piece_pos b_pawn_eval_move
                        call get_piece get_piece_return
                        be b_pawn_return get_piece_isEmpty num1
                        be b_pawn_return playercolor get_piece_color                        
		        cpta b_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1


b_pawn_return           ret b_pawn_eval_return


b_pawn_eval_return        .data 0
b_pawn_eval_move          .data 0
