//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.

//See queen_eval for comments

bishop_eval         cp possible_moves_size num0

bish_uf_init               cp border_pos boardpos
                           call border_check border_check_return
                           be bish_ub_init uf_permission num0
                           cp bish_eval_move boardpos
                             
bish_uf_check              sub bish_eval_move bish_eval_move num24
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_uf_check2 get_piece_isEmpty num1
                           be bish_ub_init playercolor get_piece_color
                      
bish_uf_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_uf_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_ub_init uf_permission num0
                           be bish_uf_check get_piece_isEmpty num1

bish_ub_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_ur_init ub_permission num0
                           cp bish_eval_move boardpos

bish_ub_check              add bish_eval_move bish_eval_move num26
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_ub_check2 get_piece_isEmpty num1
                           be bish_ur_init playercolor get_piece_color
                      
bish_ub_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_ub_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_ur_init ub_permission num0
                           be bish_ub_check get_piece_isEmpty num1

bish_ur_init               cp border_pos boardpos
                           call border_check border_check_return
                           be bish_ul_init ur_permission num0
                           cp bish_eval_move boardpos  

bish_ur_check              add bish_eval_move bish_eval_move num6
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_ur_check2 get_piece_isEmpty num1
                           be bish_ul_init playercolor get_piece_color
                      
bish_ur_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_ur_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_ul_init ur_permission num0
                           be bish_ur_check get_piece_isEmpty num1

bish_ul_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_df_init ul_permission num0
                           cp bish_eval_move boardpos

bish_ul_check              sub bish_eval_move bish_eval_move num4
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_ul_check2 get_piece_isEmpty num1
                           be bish_df_init playercolor get_piece_color
                      
bish_ul_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1
                           
bish_ul_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_df_init ul_permission num0
                           be bish_ul_check get_piece_isEmpty num1

bish_df_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_db_init df_permission num0
                           cp bish_eval_move boardpos

bish_df_check              sub bish_eval_move bish_eval_move num26
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_df_check2 get_piece_isEmpty num1
                           be bish_db_init playercolor get_piece_color
                      
bish_df_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_df_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_db_init df_permission num0
                           be bish_df_check get_piece_isEmpty num1

bish_db_init               cp border_pos boardpos
                           call border_check border_check_return
                           be bish_dr_init db_permission num0
                           cp bish_eval_move boardpos  

bish_db_check              add bish_eval_move bish_eval_move num24
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_db_check2 get_piece_isEmpty num1
                           be bish_dr_init playercolor get_piece_color
                      
bish_db_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_db_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_dr_init db_permission num0
                           be bish_db_check get_piece_isEmpty num1

bish_dr_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_dl_init dr_permission num0
                           cp bish_eval_move boardpos

bish_dr_check              add bish_eval_move bish_eval_move num4
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_dr_check2 get_piece_isEmpty num1
                           be bish_dl_init playercolor get_piece_color
                      
bish_dr_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_dr_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_dl_init dr_permission num0
                           be bish_dr_check get_piece_isEmpty num1

bish_dl_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_fr_init dl_permission num0
                           cp bish_eval_move boardpos

bish_dl_check              sub bish_eval_move bish_eval_move num6
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_dl_check2 get_piece_isEmpty num1
                           be bish_fr_init playercolor get_piece_color
                      
bish_dl_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_dl_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_fr_init dl_permission num0
                           be bish_dl_check get_piece_isEmpty num1

bish_fr_init               cp border_pos boardpos
                           call border_check border_check_return
                           be bish_fl_init fr_permission num0
                           cp bish_eval_move boardpos  

bish_fr_check              sub bish_eval_move bish_eval_move num20
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_fr_check2 get_piece_isEmpty num1
                           be bish_fl_init playercolor get_piece_color
                      
bish_fr_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_fr_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_fl_init fr_permission num0
                           be bish_fr_check get_piece_isEmpty num1

bish_fl_init        			cp border_pos boardpos
                           call border_check border_check_return
                           be bish_br_init fl_permission num0
                           cp bish_eval_move boardpos

bish_fl_check              sub bish_eval_move bish_eval_move num30
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_fl_check2 get_piece_isEmpty num1
                           be bish_br_init playercolor get_piece_color
                      
bish_fl_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_fl_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_br_init fl_permission num0
			   be bish_fl_check get_piece_isEmpty num1

bish_br_init        	   cp border_pos boardpos
                           call border_check border_check_return
                           be bish_bl_init br_permission num0
                           cp bish_eval_move boardpos

bish_br_check              add bish_eval_move bish_eval_move num30
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_br_check2 get_piece_isEmpty num1
                           be bish_bl_init playercolor get_piece_color
                      
bish_br_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_br_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_bl_init br_permission num0
                           be bish_br_check get_piece_isEmpty num1

bish_bl_init               cp border_pos boardpos
                           call border_check border_check_return
                           be bish_return bl_permission num0
                           cp bish_eval_move boardpos  

bish_bl_check              add bish_eval_move bish_eval_move num20
                           cp get_piece_pos bish_eval_move
                           call get_piece get_piece_return
                           be bish_bl_check2 get_piece_isEmpty num1
                           be bish_return playercolor get_piece_color
                      
bish_bl_check2             cpta bish_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

bish_bl_checkloop          cp border_pos bish_eval_move
                           call border_check border_check_return
                           be bish_return bl_permission num0
                           be bish_bl_check get_piece_isEmpty num1
        
bish_return                ret bishop_eval_return


bishop_eval_return           .data 0
bish_eval_move             .data 0
