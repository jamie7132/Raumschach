//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check. See b_pawn_eval for more explanation on how this eval works.

w_pawn_eval    		cp possible_moves_size num0
                        cp border_pos boardpos
                        call border_check border_check_return
         
w_pawn_back_check       be w_pawn_up_check back_permission num0
                        cp w_pawn_eval_move boardpos  
                        add w_pawn_eval_move w_pawn_eval_move num25                          
                        cp get_piece_pos w_pawn_eval_move 
                        call get_piece get_piece_return
                        bne w_pawn_up_check get_piece_isEmpty num1 //If not empty, look at next possibility
			cpta w_pawn_eval_move possible_moves possible_moves_size                                    
                        add possible_moves_size possible_moves_size num1

                         
w_pawn_up_check      	be w_pawn_ur_check up_permission num0
                        cp w_pawn_eval_move boardpos
                        add w_pawn_eval_move w_pawn_eval_move num1
                        cp get_piece_pos w_pawn_eval_move
                        call get_piece get_piece_return
                        bne w_pawn_ur_check get_piece_isEmpty num1
			cpta w_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         

w_pawn_ur_check         be w_pawn_ul_check ur_permission num0
                        cp w_pawn_eval_move boardpos
                        add w_pawn_eval_move w_pawn_eval_move num6
                        cp get_piece_pos w_pawn_eval_move
                        call get_piece get_piece_return
                        be w_pawn_ul_check get_piece_isEmpty num1
                        be w_pawn_ul_check playercolor get_piece_color                        
        		cpta w_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

w_pawn_ul_check         be w_pawn_br_check ul_permission num0
                        cp w_pawn_eval_move boardpos
                        sub w_pawn_eval_move w_pawn_eval_move num4
                        cp get_piece_pos w_pawn_eval_move
                        call get_piece get_piece_return
                        be w_pawn_br_check get_piece_isEmpty num1
                        be w_pawn_br_check playercolor get_piece_color                        
		        cpta w_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
w_pawn_br_check         be w_pawn_bl_check br_permission num0
                        cp w_pawn_eval_move boardpos
                        add w_pawn_eval_move w_pawn_eval_move num30
                        cp get_piece_pos w_pawn_eval_move
                        call get_piece get_piece_return
                        be w_pawn_bl_check get_piece_isEmpty num1
                        be w_pawn_bl_check playercolor get_piece_color                        
		        cpta w_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

w_pawn_bl_check         be w_pawn_return bl_permission num0
                        cp w_pawn_eval_move boardpos
                        add w_pawn_eval_move w_pawn_eval_move num20
                        cp get_piece_pos w_pawn_eval_move
                        call get_piece get_piece_return
                        be w_pawn_return get_piece_isEmpty num1
                        be w_pawn_return playercolor get_piece_color                        
		        cpta w_pawn_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1


w_pawn_return           ret w_pawn_eval_return


w_pawn_eval_return        .data 0
w_pawn_eval_move          .data 0
