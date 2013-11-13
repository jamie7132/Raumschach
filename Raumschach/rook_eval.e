//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.

//See queen_eval for comments

rook_eval         	   	cp rook_eval_index num0
                           cp possible_moves_size num0

rook_for_init					cp border_pos boardpos
                           call border_check border_check_return
                           be rook_back_init for_permission num0
                           cp rook_eval_move boardpos
                                        
rook_for_check             sub rook_eval_move rook_eval_move num25
                           cp get_piece_pos rook_eval_move 
                           call get_piece get_piece_return 
                           be rook_for_check2 get_piece_isEmpty num1 
                           be rook_back_init playercolor get_piece_color 
                      
rook_for_check2            cpta rook_eval_move possible_moves rook_eval_index 
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_for_checkloop         cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_back_init for_permission num0
                           be rook_for_check get_piece_isEmpty num1

rook_back_init					cp border_pos boardpos
                           call border_check border_check_return
                           be rook_left_init back_permission num0
                           cp rook_eval_move boardpos

rook_back_check            add rook_eval_move rook_eval_move num25
                           cp get_piece_pos rook_eval_move
                           call get_piece get_piece_return
                           be rook_back_check2 get_piece_isEmpty num1
                           be rook_left_init playercolor get_piece_color
                      
rook_back_check2           cpta rook_eval_move possible_moves rook_eval_index
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_back_checkloop        cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_left_init back_permission num0
                           be rook_back_check get_piece_isEmpty num1

rook_left_init					cp border_pos boardpos
                           call border_check border_check_return
                           be rook_right_init left_permission num0
                           cp rook_eval_move boardpos
                      
rook_left_check            sub rook_eval_move rook_eval_move num5
                           cp get_piece_pos rook_eval_move
                           call get_piece get_piece_return
                           be rook_left_check2 get_piece_isEmpty num1
                           be rook_right_init playercolor get_piece_color
                      
rook_left_check2           cpta rook_eval_move possible_moves rook_eval_index
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_left_checkloop        cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_right_init left_permission num0
                           be rook_left_check get_piece_isEmpty num1

rook_right_init				cp border_pos boardpos
                           call border_check border_check_return
                           be rook_down_init right_permission num0
                           cp rook_eval_move boardpos
         
rook_right_check           add rook_eval_move rook_eval_move num5
                           cp get_piece_pos rook_eval_move
                           call get_piece get_piece_return
                           be rook_right_check2 get_piece_isEmpty num1
                           be rook_down_init playercolor get_piece_color
                      
rook_right_check2          cpta rook_eval_move possible_moves rook_eval_index
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_right_checkloop       cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_down_init right_permission num0
                           be rook_right_check get_piece_isEmpty num1

rook_down_init					cp border_pos boardpos
                           call border_check border_check_return
                           be rook_up_init down_permission num0
                           cp rook_eval_move boardpos
                 
rook_down_check            sub rook_eval_move rook_eval_move num1
                           cp get_piece_pos rook_eval_move
                           call get_piece get_piece_return
                           be rook_down_check2 get_piece_isEmpty num1
                           be rook_up_init playercolor get_piece_color
                      
rook_down_check2           cpta rook_eval_move possible_moves rook_eval_index
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_down_checkloop        cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_up_init down_permission num0
                           be rook_down_check get_piece_isEmpty num1

rook_up_init					cp border_pos boardpos
                           call border_check border_check_return
                           be rook_return up_permission num0
                           cp rook_eval_move boardpos
        
rook_up_check              add rook_eval_move rook_eval_move num1
                           cp get_piece_pos rook_eval_move
                           call get_piece get_piece_return
                           be rook_up_check2 get_piece_isEmpty num1
                           be rook_return playercolor get_piece_color
                      
rook_up_check2             cpta rook_eval_move possible_moves rook_eval_index
                           add rook_eval_index rook_eval_index num1
                           add possible_moves_size possible_moves_size num1

rook_up_checkloop          cp border_pos rook_eval_move
                           call border_check border_check_return
                           be rook_return up_permission num0
                           be rook_up_check get_piece_isEmpty num1
                
rook_return                ret rook_eval_return

rook_eval_index            .data 0
rook_eval_return           .data 0
rook_eval_move             .data 0
