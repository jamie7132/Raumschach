//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.

king_eval      			cp possible_moves_size num0					//Reset the size of the possible_moves array
                        cp border_pos boardpos							//Set border_pos to the position of the piece being evaluated
                        call border_check border_check_return		//Call border_check to determine initial permissions
         	
king_for_check          be king_back_check for_permission num0		//If don't have permission to move in this direction, move to next direction
                        cp king_eval_move boardpos  					//Set the king's position to king_eval_move
                        sub king_eval_move king_eval_move num25   //Change king_eval_move to the new proposed move                       
                        cp get_piece_pos king_eval_move 				//Set get_piece_pos to the new proposed move
                        call get_piece get_piece_return				//Call get_piece 
                        be king_for_check2 get_piece_isEmpty num1	//If the piece at this position is empty, go to king_for_check2
                        be king_back_check playercolor get_piece_color	//If the piece at this position is the same color as the king go to the next direction
                        
king_for_check2         cpta king_eval_move possible_moves possible_moves_size   //After being checked for validity, add the proposed move to the possible move array                                 
                        add possible_moves_size possible_moves_size num1			//Increase the size of the possible_moves array

king_back_check         be king_left_check back_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num25
								cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_back_check2 get_piece_isEmpty num1
                        be king_left_check playercolor get_piece_color
                        
king_back_check2        cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
                       
king_left_check         be king_right_check left_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num5
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_left_check2 get_piece_isEmpty num1
                        be king_right_check playercolor get_piece_color
                        
king_left_check2        cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
                          
king_right_check        be king_down_check right_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num5
								cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_right_check2 get_piece_isEmpty num1
                        be king_down_check playercolor get_piece_color
                        
king_right_check2       cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
                              
king_down_check         be king_up_check down_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num1
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_down_check2 get_piece_isEmpty num1
                        be king_up_check playercolor get_piece_color
                        
king_down_check2        cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1


king_up_check           be king_ufr_check up_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num1
								cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_up_check2 get_piece_isEmpty num1
                        be king_ufr_check playercolor get_piece_color
                        
king_up_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ufr_check          be king_ubr_check ufr_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num19
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ufr_check2 get_piece_isEmpty num1
                        be king_ubr_check playercolor get_piece_color
                        
king_ufr_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
king_ubr_check          be king_ufl_check ubr_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num31
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ubr_check2 get_piece_isEmpty num1
                        be king_ufl_check playercolor get_piece_color
                        
king_ubr_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ufl_check          be king_ubl_check ufl_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num29
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ufl_check2 get_piece_isEmpty num1
                        be king_ubl_check playercolor get_piece_color
                        
king_ufl_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ubl_check          be king_dfr_check ubl_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num21
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ubl_check2 get_piece_isEmpty num1
                        be king_dfr_check playercolor get_piece_color
                        
king_ubl_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
king_dfr_check          be king_dbr_check dfr_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num21
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dfr_check2 get_piece_isEmpty num1
                        be king_dbr_check playercolor get_piece_color
                        
king_dfr_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1                      

king_dbr_check          be king_dfl_check dbr_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num29
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dbr_check2 get_piece_isEmpty num1
                        be king_dfl_check playercolor get_piece_color
                        
king_dbr_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_dfl_check          be king_dbl_check dfl_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num31
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dfl_check2 get_piece_isEmpty num1
                        be king_dbl_check playercolor get_piece_color

king_dfl_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
          
king_dbl_check          be king_uf_check dbl_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num19
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dbl_check2 get_piece_isEmpty num1
                        be king_uf_check playercolor get_piece_color
                        
king_dbl_check2         cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_uf_check           be king_ub_check uf_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num24
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_uf_check2 get_piece_isEmpty num1
                        be king_ub_check playercolor get_piece_color
                        
king_uf_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ub_check           be king_ur_check ub_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num26
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ub_check2 get_piece_isEmpty num1
                        be king_ur_check playercolor get_piece_color
                        
king_ub_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ur_check           be king_ul_check ur_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num6
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ur_check2 get_piece_isEmpty num1
                        be king_ul_check playercolor get_piece_color
                        
king_ur_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_ul_check           be king_df_check ul_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num4
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_ul_check2 get_piece_isEmpty num1
                        be king_df_check playercolor get_piece_color
                        
king_ul_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_df_check           be king_db_check df_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num26
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_df_check2 get_piece_isEmpty num1
                        be king_db_check playercolor get_piece_color
                        
king_df_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
          
king_db_check           be king_dr_check db_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num24
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_db_check2 get_piece_isEmpty num1
                        be king_dr_check playercolor get_piece_color
                        
king_db_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_dr_check           be king_dl_check dr_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num4
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dr_check2 get_piece_isEmpty num1
                        be king_dl_check playercolor get_piece_color
                        
king_dr_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_dl_check           be king_fr_check dl_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num6
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_dl_check2 get_piece_isEmpty num1
                        be king_fr_check playercolor get_piece_color
                        
king_dl_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
         
king_fr_check           be king_fl_check fr_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num20
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_fr_check2 get_piece_isEmpty num1
                        be king_fl_check playercolor get_piece_color
                        
king_fr_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_fl_check           be king_br_check fl_permission num0
                        cp king_eval_move boardpos
                        sub king_eval_move king_eval_move num30
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_fl_check2 get_piece_isEmpty num1
                        be king_br_check playercolor get_piece_color
                        
king_fl_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_br_check           be king_bl_check br_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num30
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_br_check2 get_piece_isEmpty num1
                        be king_bl_check playercolor get_piece_color
                        
king_br_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1
       
king_bl_check           be king_return bl_permission num0
                        cp king_eval_move boardpos
                        add king_eval_move king_eval_move num20
                        cp get_piece_pos king_eval_move
                        call get_piece get_piece_return
                        be king_bl_check2 get_piece_isEmpty num1
                        be king_return playercolor get_piece_color
                        
king_bl_check2          cpta king_eval_move possible_moves possible_moves_size
                        add possible_moves_size possible_moves_size num1

king_return             ret king_eval_return


king_eval_return        .data 0
king_eval_move          .data 0
