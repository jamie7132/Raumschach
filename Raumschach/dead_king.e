dead_king              		cp 	dead_king_index 	num0                         			//reset index

dead_king_white_loop	be 	white_king_is_dead dead_king_index num125    					//if entire board is checked, the white king is dead
                        	cpfa 	maybe_king board_start dead_king_index     				//copy the value at this board position to maybe_king
									add dead_king_index dead_king_index num1        				//enumerate the index
									bne dead_king_white_loop maybe_king num7    						//if the value matches the white king, move to reset the index, else, loop

reset_dead_king_index   	cp 	dead_king_index 	num0                   					//reset index
                        	be 	dead_king_black_loop 	0	0              				//goto dead_king_black_loop
                      
white_king_is_dead      	cp 	dead_white_king 	num1              			        	//indicate that the white king is dead
                        	be 	reset_dead_king_index 	0	0									//go to reset the index
							
dead_king_black_loop	be 	black_king_is_dead 	dead_king_index		num125           	//same as dead_king_white_loop, except checking for the black king
                        	cpfa 	maybe_king 		board_start 		dead_king_index
									add 	dead_king_index 	dead_king_index 	num1
									bne 	dead_king_black_loop 	maybe_king 		num14

dead_king_esc	        		ret 	dead_king_return                            				//return

black_king_is_dead      	cp 	dead_black_king 	num1                         			//indicate that the black king is dead
                        	be 	dead_king_esc 		0	0                   					//Go to return
							   
dead_king_index         .data 0
maybe_king              .data 0
dead_white_king         .data 0
dead_black_king         .data 0
dead_king_return        .data 0
