//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.
queen_eval        			cp possible_moves_size num0 							//Reset the size of the possible move arrays

queen_for_init					cp border_pos boardpos									//Set border_pos (border_check input variable) to the queen's location
                           call border_check border_check_return				//Call border_check to get permissions at current location
                           be queen_back_init for_permission num0				//Go to the next direction if permission is turned off for this direction
                           cp queen_eval_move boardpos  							//set temp variable to position of piece
                                         
queen_for_check            sub queen_eval_move queen_eval_move num25 		//Set the temp variable to the new proposed move
                           cp get_piece_pos queen_eval_move 					//set the get_piece input variable to the proposed move
                           call get_piece get_piece_return 						//call get_piece
                           be queen_for_check2 get_piece_isEmpty num1 		//if this space is empty goto to check2
                           be queen_back_init playercolor get_piece_color 	//if same color, move to new direction
                       
queen_for_check2           cpta queen_eval_move possible_moves possible_moves_size 	//put the proposed move in possible_moves array
                           add possible_moves_size possible_moves_size num1    		//enumerate possible_moves size

queen_for_checkloop        cp border_pos queen_eval_move							//Set border_pos to the queen's location if it moved to the new spot
                           call border_check border_check_return				//Call border_check to see permissions at this new spot
                           be queen_back_init for_permission num0				//If this new location would hit a border, go to the next direction
                           be queen_for_check get_piece_isEmpty num1 		//If the current space is empty, loop to for_check to find the next move in this direction

queen_back_init				cp border_pos boardpos
                           call border_check border_check_return
                           be queen_left_init back_permission num0
                           cp queen_eval_move boardpos

queen_back_check           add queen_eval_move queen_eval_move num25
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_back_check2 get_piece_isEmpty num1
                           be queen_left_init playercolor get_piece_color
                       
queen_back_check2          cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_back_checkloop       cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_left_init back_permission num0
                           be queen_back_check get_piece_isEmpty num1 

queen_left_init				cp border_pos boardpos
                           call border_check border_check_return
                           be queen_right_init left_permission num0
                           cp queen_eval_move boardpos
                       
queen_left_check           sub queen_eval_move queen_eval_move num5
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_left_check2 get_piece_isEmpty num1
                           be queen_right_init playercolor get_piece_color
                       
queen_left_check2          cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_left_checkloop       cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_right_init left_permission num0
                           be queen_left_check get_piece_isEmpty num1 

queen_right_init				cp border_pos boardpos
                           call border_check border_check_return
                           be queen_down_init right_permission num0
                           cp queen_eval_move boardpos
         
queen_right_check          add queen_eval_move queen_eval_move num5
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_right_check2 get_piece_isEmpty num1
                           be queen_down_init playercolor get_piece_color
                       
queen_right_check2         cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_right_checkloop      cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_down_init right_permission num0
                           be queen_right_check get_piece_isEmpty num1 

queen_down_init				cp border_pos boardpos
                           call border_check border_check_return
                           be queen_up_init down_permission num0
                           cp queen_eval_move boardpos
                 
queen_down_check           sub queen_eval_move queen_eval_move num1
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_down_check2 get_piece_isEmpty num1
                           be queen_up_init playercolor get_piece_color
                       
queen_down_check2          cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_down_checkloop       cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_up_init down_permission num0
                           be queen_down_check get_piece_isEmpty num1 

queen_up_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ufr_init up_permission num0
                           cp queen_eval_move boardpos
        
queen_up_check             add queen_eval_move queen_eval_move num1
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_up_check2 get_piece_isEmpty num1
                           be queen_ufr_init playercolor get_piece_color
                       
queen_up_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_up_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ufr_init up_permission num0
                           be queen_up_check get_piece_isEmpty num1 

queen_ufr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ubr_init ufr_permission num0
                           cp queen_eval_move boardpos
        
queen_ufr_check            sub queen_eval_move queen_eval_move num19
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ufr_check2 get_piece_isEmpty num1
                           be queen_ubr_init playercolor get_piece_color
                       
queen_ufr_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ufr_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ubr_init ufr_permission num0
                           be queen_ufr_check get_piece_isEmpty num1                        

queen_ubr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ufl_init ubr_permission num0
                           cp queen_eval_move boardpos
         
queen_ubr_check            add queen_eval_move queen_eval_move num31
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ubr_check2 get_piece_isEmpty num1
                           be queen_ufl_init playercolor get_piece_color
                       
queen_ubr_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ubr_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ufl_init ubr_permission num0
                           be queen_ubr_check get_piece_isEmpty num1 

queen_ufl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ubl_init ufl_permission num0
                           cp queen_eval_move boardpos
        
queen_ufl_check            sub queen_eval_move queen_eval_move num29
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ufl_check2 get_piece_isEmpty num1
                           be queen_ubl_init playercolor get_piece_color
                       
queen_ufl_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ufl_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ubl_init ufl_permission num0
                           be queen_ufl_check get_piece_isEmpty num1 
 
queen_ubl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dfr_init ubl_permission num0
                           cp queen_eval_move boardpos
       
queen_ubl_check            add queen_eval_move queen_eval_move num21
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ubl_check2 get_piece_isEmpty num1
                       
queen_ubl_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1
                           call border_check border_check_return

queen_ubl_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dfr_init ubl_permission num0
                           be queen_ubl_check get_piece_isEmpty num1 

queen_dfr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dbr_init dfr_permission num0
                           cp queen_eval_move boardpos
                 
queen_dfr_check            sub queen_eval_move queen_eval_move num21
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dfr_check2 get_piece_isEmpty num1
                           be queen_dbr_init playercolor get_piece_color
                       
queen_dfr_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1
                           call border_check border_check_return

queen_dfr_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dbr_init dfr_permission num0
                           be queen_dfr_check get_piece_isEmpty num1 

queen_dbr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dfl_init dbr_permission num0
                           cp queen_eval_move boardpos
        
queen_dbr_check            add queen_eval_move queen_eval_move num29
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dbr_check2 get_piece_isEmpty num1
                           be queen_dfl_init playercolor get_piece_color
                       
queen_dbr_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_dbr_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dfl_init dbr_permission num0
                           be queen_dbr_check get_piece_isEmpty num1 

queen_dfl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dbl_init dfl_permission num0
                           cp queen_eval_move boardpos
        
queen_dfl_check            sub queen_eval_move queen_eval_move num31
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dfl_check2 get_piece_isEmpty num1
                           be queen_dbl_init playercolor get_piece_color
                       
queen_dfl_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_dfl_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dbl_init dfl_permission num0
                           be queen_dfl_check get_piece_isEmpty num1 

queen_dbl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_uf_init dbl_permission num0
                           cp queen_eval_move boardpos
                 
queen_dbl_check            add queen_eval_move queen_eval_move num19
                       		cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dbl_check2 get_piece_isEmpty num1
                           be queen_uf_init playercolor get_piece_color
                       
queen_dbl_check2           cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_dbl_checkloop        cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_uf_init dbl_permission num0
                           be queen_dbl_check get_piece_isEmpty num1 

queen_uf_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ub_init uf_permission num0
                           cp queen_eval_move boardpos
        
queen_uf_check             sub queen_eval_move queen_eval_move num24
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_uf_check2 get_piece_isEmpty num1
                           be queen_ub_init playercolor get_piece_color
                       
queen_uf_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_uf_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ub_init uf_permission num0
                           be queen_uf_check get_piece_isEmpty num1 

queen_ub_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ur_init ub_permission num0
                           cp queen_eval_move boardpos
        
queen_ub_check             add queen_eval_move queen_eval_move num26
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ub_check2 get_piece_isEmpty num1
                           be queen_ur_init playercolor get_piece_color
                       
queen_ub_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ub_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ur_init ub_permission num0
                           be queen_ub_check get_piece_isEmpty num1 

queen_ur_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_ul_init ur_permission num0
                           cp queen_eval_move boardpos
                 
queen_ur_check             add queen_eval_move queen_eval_move num6
                       		cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ur_check2 get_piece_isEmpty num1
                           be queen_ul_init playercolor get_piece_color
                       
queen_ur_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ur_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_ul_init ur_permission num0
                           be queen_ur_check get_piece_isEmpty num1 

queen_ul_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_df_init ul_permission num0
                           cp queen_eval_move boardpos
        
queen_ul_check             sub queen_eval_move queen_eval_move num4
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_ul_check2 get_piece_isEmpty num1
                           be queen_df_init playercolor get_piece_color
                       
queen_ul_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_ul_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_df_init ul_permission num0
                           be queen_ul_check get_piece_isEmpty num1 

queen_df_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_db_init df_permission num0
                           cp queen_eval_move boardpos
        
queen_df_check             sub queen_eval_move queen_eval_move num26
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_df_check2 get_piece_isEmpty num1
                           be queen_db_init playercolor get_piece_color
                       
queen_df_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_df_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_db_init df_permission num0
                           be queen_df_check get_piece_isEmpty num1 

queen_db_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dr_init db_permission num0
                           cp queen_eval_move boardpos
                 
queen_db_check             add queen_eval_move queen_eval_move num24
                       		cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_db_check2 get_piece_isEmpty num1
                           be queen_dr_init playercolor get_piece_color
                       
queen_db_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_db_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dr_init db_permission num0
                           be queen_db_check get_piece_isEmpty num1 

queen_dr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_dl_init dr_permission num0
                           cp queen_eval_move boardpos
        
queen_dr_check             add queen_eval_move queen_eval_move num4
                       		cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dr_check2 get_piece_isEmpty num1
                           be queen_dl_init playercolor get_piece_color
                       
queen_dr_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_dr_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_dl_init dr_permission num0
                           be queen_dr_check get_piece_isEmpty num1 

queen_dl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_fr_init dl_permission num0
                           cp queen_eval_move boardpos
        
queen_dl_check             sub queen_eval_move queen_eval_move num6
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_dl_check2 get_piece_isEmpty num1
                           be queen_fr_init playercolor get_piece_color
                       
queen_dl_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_dl_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_fr_init dl_permission num0
                           be queen_dl_check get_piece_isEmpty num1 

queen_fr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_fl_init fr_permission num0
                           cp queen_eval_move boardpos
                 
queen_fr_check             sub queen_eval_move queen_eval_move num20
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_fr_check2 get_piece_isEmpty num1
                           be queen_fl_init playercolor get_piece_color
                       
queen_fr_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_fr_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_fl_init fr_permission num0
                           be queen_fr_check get_piece_isEmpty num1 

queen_fl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_br_init fl_permission num0
                           cp queen_eval_move boardpos
        
queen_fl_check             sub queen_eval_move queen_eval_move num30
                           cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_fl_check2 get_piece_isEmpty num1
                           be queen_br_init playercolor get_piece_color
                       
queen_fl_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_fl_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_br_init fl_permission num0
                           be queen_fl_check get_piece_isEmpty num1 

queen_br_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_bl_init br_permission num0
                           cp queen_eval_move boardpos
        
queen_br_check             add queen_eval_move queen_eval_move num30
									cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_br_check2 get_piece_isEmpty num1
                           be queen_bl_init playercolor get_piece_color
                       
queen_br_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_br_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_bl_init br_permission num0
                           be queen_br_check get_piece_isEmpty num1 

queen_bl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be queen_return bl_permission num0
                           cp queen_eval_move boardpos
                 
queen_bl_check             add queen_eval_move queen_eval_move num20
                       		cp get_piece_pos queen_eval_move
                           call get_piece get_piece_return
                           be queen_bl_check2 get_piece_isEmpty num1
                           be queen_return playercolor get_piece_color
                       
queen_bl_check2            cpta queen_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

queen_bl_checkloop         cp border_pos queen_eval_move
                           call border_check border_check_return
                           be queen_return bl_permission num0
                           be queen_bl_check get_piece_isEmpty num1 
        
queen_return               ret queen_eval_return


queen_eval_return          .data 0
queen_eval_move            .data 0
