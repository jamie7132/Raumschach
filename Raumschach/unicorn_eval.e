//Given boardpos(the position of the piece) returns array possible_moves (which should be instatiated in the main program) and variable           
//possible_moves_size (should also be instatiated in main program). Array possible_moves contains several numbers. Each number corresponds to a 
//position on the board that the piece can move to based on its curent position. Uses several global number variables. Also calls get_piece and
//border_check.

//See queen_eval for comments

unicorn_eval          		cp possible_moves_size num0

uni_ufr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_ubr_init ufr_permission num0
                           cp uni_eval_move boardpos

uni_ufr_check              sub uni_eval_move uni_eval_move num19
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_ufr_check2 get_piece_isEmpty num1
                           be uni_ubr_init playercolor get_piece_color
                      
uni_ufr_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_ufr_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_ubr_init ufr_permission num0
                           be uni_ufr_check get_piece_isEmpty num1                        

uni_ubr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_ufl_init ubr_permission num0
                           cp uni_eval_move boardpos
         
uni_ubr_check              add uni_eval_move uni_eval_move num31
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_ubr_check2 get_piece_isEmpty num1
                           be uni_ufl_init playercolor get_piece_color
                      
uni_ubr_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_ubr_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_ufl_init ubr_permission num0
                           be uni_ubr_check get_piece_isEmpty num1

uni_ufl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_ubl_init ufl_permission num0
                           cp uni_eval_move boardpos
        
uni_ufl_check              sub uni_eval_move uni_eval_move num29
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_ufl_check2 get_piece_isEmpty num1
                           be uni_ubl_init playercolor get_piece_color
                      
uni_ufl_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_ufl_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_ubl_init ufl_permission num0
                           be uni_ufl_check get_piece_isEmpty num1

uni_ubl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_dfr_init ubl_permission num0
                           cp uni_eval_move boardpos                          
        
uni_ubl_check              add uni_eval_move uni_eval_move num21
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_ubl_check2 get_piece_isEmpty num1
                           be uni_dfr_init playercolor get_piece_color
                      
uni_ubl_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_ubl_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_dfr_init ubl_permission num0
                           be uni_ubl_check get_piece_isEmpty num1

uni_dfr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_dbr_init dfr_permission num0
                           cp uni_eval_move boardpos
                 
uni_dfr_check              sub uni_eval_move uni_eval_move num21
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_dfr_check2 get_piece_isEmpty num1
                           be uni_dbr_init playercolor get_piece_color
                      
uni_dfr_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_dfr_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_dbr_init dfr_permission num0
                           be uni_dfr_check get_piece_isEmpty num1

uni_dbr_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_dfl_init dbr_permission num0
                           cp uni_eval_move boardpos
        
uni_dbr_check              add uni_eval_move uni_eval_move num29
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_dbr_check2 get_piece_isEmpty num1
                           be uni_dfl_init playercolor get_piece_color
                      
uni_dbr_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_dbr_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_dfl_init dbr_permission num0
                           be uni_dbr_check get_piece_isEmpty num1

uni_dfl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_dbl_init dfl_permission num0
                           cp uni_eval_move boardpos
        
uni_dfl_check              sub uni_eval_move uni_eval_move num31
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_dfl_check2 get_piece_isEmpty num1
                           be uni_dbl_init playercolor get_piece_color

uni_dfl_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_dfl_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_dbl_init dfl_permission num0
                           be uni_dfl_check get_piece_isEmpty num1

uni_dbl_init					cp border_pos boardpos
                           call border_check border_check_return
                           be uni_return dbl_permission num0
                           cp uni_eval_move boardpos
                 
uni_dbl_check              add uni_eval_move uni_eval_move num19
                           cp get_piece_pos uni_eval_move
                           call get_piece get_piece_return
                           be uni_dbl_check2 get_piece_isEmpty num1
                           be uni_return playercolor get_piece_color
                      
uni_dbl_check2             cpta uni_eval_move possible_moves possible_moves_size
                           add possible_moves_size possible_moves_size num1

uni_dbl_checkloop          cp border_pos uni_eval_move
                           call border_check border_check_return
                           be uni_return dbl_permission num0
                           be uni_dbl_check get_piece_isEmpty num1
                
uni_return                 ret unicorn_eval_return

unicorn_eval_return            .data 0
uni_eval_move              .data 0
