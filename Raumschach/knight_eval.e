// Determine possible positions of the knight
// Input knight position index as boardpos


// find boardpos mod 5
knight_eval		cp mod_mod1 boardpos
			cp mod_mod2 num5
			call mod mod_return
			cp knight_eval_mod5 mod_modResult

// knight_eval_mod5 is now equal to boardpos%5
// find boardpos mod 25
			cp mod_mod1 boardpos
			cp mod_mod2 num25
			call mod mod_return
			cp knight_eval_mod25 mod_modResult

// knight_eval_mod5 is now equal to boardpos%25
			cp possible_moves_size num0					//reset possible moves size

// See if it can move up two spaces
knight_eval_up2		blt knight_eval_down2 num2 knight_eval_mod5 			// valid if i%5 < 3

knight_eval_up2a	blt knight_eval_up2b num19 knight_eval_mod25 			// valid if i%25 < 20
			add knight_eval_pos boardpos num7 				// position + 2 + 5
			cp get_piece_pos knight_eval_pos 				//set move to get_piece input var
                        call get_piece get_piece_return 				//call get_piece
                        be knight_eval_up2a2 get_piece_isEmpty num1 
                        be knight_eval_up2b playercolor get_piece_color
			
knight_eval_up2a2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size
			

knight_eval_up2b	blt knight_eval_up2c knight_eval_mod25 num5 			// valid if i%25 > 4
			sub knight_eval_pos boardpos num3 				// position + 2 - 5
			cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_up2b2 get_piece_isEmpty num1 
                        be knight_eval_up2c playercolor get_piece_color

knight_eval_up2b2       cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_up2c	blt knight_eval_up2d num99 boardpos 				// valid if i < 100
			add knight_eval_pos boardpos num27 				// position + 2 + 25
			cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_up2c2 get_piece_isEmpty num1 
                        be knight_eval_up2d playercolor get_piece_color
                        
knight_eval_up2c2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size
                        
knight_eval_up2d	blt knight_eval_down2 boardpos num25 				// valid if i>24
			sub knight_eval_pos boardpos num23 				// position + 2 - 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_up2d2 get_piece_isEmpty num1 
                        be knight_eval_down2 playercolor get_piece_color
                        
knight_eval_up2d2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_down2	blt knight_eval_right2 knight_eval_mod5 num2 			// valid if i%5 > 1

knight_eval_down2a	blt knight_eval_down2b num19 knight_eval_mod25 			// valid if i%25 < 20
			add knight_eval_pos boardpos num3 				// position - 2 + 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_down2a2 get_piece_isEmpty num1 
                        be knight_eval_down2b playercolor get_piece_color
                        
knight_eval_down2a2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_down2b	blt knight_eval_down2c knight_eval_mod25 num5 			// valid if i%25 > 4
			sub knight_eval_pos boardpos num7 				// position - 2 - 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_down2b2 get_piece_isEmpty num1 
                        be knight_eval_down2c playercolor get_piece_color
                        
knight_eval_down2b2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_down2c	blt knight_eval_down2d num99 boardpos 				// valid if i < 100
			add knight_eval_pos boardpos  num23 				// position - 2 + 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_down2c2 get_piece_isEmpty num1 
                        be knight_eval_down2d playercolor get_piece_color
                        
knight_eval_down2c2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_down2d	blt knight_eval_right2 boardpos num25 				// valid if i>24
			sub knight_eval_pos boardpos num27 				// position - 2 - 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_down2d2 get_piece_isEmpty num1 
                        be knight_eval_right2 playercolor get_piece_color
                        
knight_eval_down2d2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_right2	blt knight_eval_left2 num14 knight_eval_mod25 			// valid if i%25 < 15

knight_eval_right2a	blt knight_eval_right2b num3 knight_eval_mod5 			// valid if i%5 < 4
			               add knight_eval_pos boardpos num11 				// position + 10 + 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_right2a2 get_piece_isEmpty num1 
                        be knight_eval_right2b playercolor get_piece_color
                        
knight_eval_right2a2	cpta knight_eval_pos possible_moves possible_moves_size 	// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1 		// update possible moves array size

knight_eval_right2b	blt knight_eval_right2c	knight_eval_mod5 num1			// valid if i%5 > 0
			               add knight_eval_pos boardpos num9				// position + 10 - 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_right2b2 get_piece_isEmpty num1 
                        be knight_eval_right2c playercolor get_piece_color
                        
knight_eval_right2b2	cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_right2c	blt knight_eval_right2d num99 boardpos				// valid if i < 100
			               add knight_eval_pos boardpos num35				// position + 10 + 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_right2c2 get_piece_isEmpty num1 
                        be knight_eval_right2d playercolor get_piece_color
                        
knight_eval_right2c2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_right2d	   blt knight_eval_left2 boardpos num25				// valid if i>24
			               sub knight_eval_pos boardpos num15				// position + 10 - 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_right2d2 get_piece_isEmpty num1 
                        be knight_eval_left2 playercolor get_piece_color
                        
knight_eval_right2d2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_left2	      blt knight_eval_back2 knight_eval_mod25 num10			// valid if i%25 > 9

knight_eval_left2a	   blt knight_eval_left2b num3 knight_eval_mod5			// valid if i%5 < 4
			               sub knight_eval_pos boardpos num9				// position - 10 + 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_left2a2 get_piece_isEmpty num1 
                        be knight_eval_left2b playercolor get_piece_color
                        
knight_eval_left2a2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_left2b	   blt knight_eval_left2c knight_eval_mod5 num1			// valid if i%5 > 4
			               sub knight_eval_pos boardpos num11				// position -10 - 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_left2b2 get_piece_isEmpty num1 
                        be knight_eval_left2c playercolor get_piece_color
                        
knight_eval_left2b2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_left2c	   blt knight_eval_left2d num99 boardpos				// valid if i < 100
			               add knight_eval_pos boardpos num15				// position - 10 + 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_left2c2 get_piece_isEmpty num1 
                        be knight_eval_left2d playercolor get_piece_color
                        
knight_eval_left2c2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_left2d	   blt knight_eval_back2 boardpos num25				// valid if i>24
			               sub knight_eval_pos boardpos num35				// position - 10 - 25
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_left2d2 get_piece_isEmpty num1 
                        be knight_eval_back2 playercolor get_piece_color
                        
knight_eval_left2d2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_back2	      blt knight_eval_fwd2 num74 boardpos				// valid if i < 75

knight_eval_back2a	   blt knight_eval_back2b num3 knight_eval_mod5			// valid if i%5 < 4
			               add knight_eval_pos boardpos num51				// position + 50 + 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_back2a2 get_piece_isEmpty num1 
                        be knight_eval_back2b playercolor get_piece_color
                        
knight_eval_back2a2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_back2b	blt knight_eval_back2c	knight_eval_mod5 num1			// valid if i%5 > 0
			add knight_eval_pos boardpos num49					// position + 50 - 1
			cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_back2b2 get_piece_isEmpty num1 
                        be knight_eval_back2c playercolor get_piece_color

knight_eval_back2b2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size
                        
                        
knight_eval_back2c	   blt knight_eval_back2d num19 knight_eval_mod25			// valid if i%25 < 20
			               add knight_eval_pos boardpos num55				// position + 50 + 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_back2c2 get_piece_isEmpty num1 
                        be knight_eval_back2d playercolor get_piece_color
                        
knight_eval_back2c2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_back2d	   blt knight_eval_fwd2 knight_eval_mod25 num5			// valid if i%25 > 4
			               add knight_eval_pos boardpos num45				// position + 50 - 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_back2d2 get_piece_isEmpty num1 
                        be knight_eval_fwd2 playercolor get_piece_color
                        
knight_eval_back2d2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_fwd2	      blt knight_eval_esc boardpos num50				// valid if i > 49

knight_eval_fwd2a	      blt knight_eval_fwd2b num3 knight_eval_mod5			// if i%5 < 4
			               sub knight_eval_pos boardpos num49				// position - 50 + 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_fwd2a2 get_piece_isEmpty num1 
                        be knight_eval_fwd2b playercolor get_piece_color
                        
knight_eval_fwd2a2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_fwd2b	      blt knight_eval_fwd2c	knight_eval_mod5 num1			// valid if i%5 > 0
			               sub knight_eval_pos boardpos num51				// position - 50 - 1
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_fwd2b2 get_piece_isEmpty num1 
                        be knight_eval_fwd2c playercolor get_piece_color
                        
knight_eval_fwd2b2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_fwd2c	      blt knight_eval_fwd2d num19 knight_eval_mod25			// valid if i%25 < 20
			               sub knight_eval_pos boardpos num45				// position - 50 + 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_fwd2c2 get_piece_isEmpty num1 
                        be knight_eval_fwd2d playercolor get_piece_color
                        
knight_eval_fwd2c2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_fwd2d	      blt knight_eval_esc knight_eval_mod25 num5			// valid if i%25 > 4
			               sub knight_eval_pos boardpos num55				// position - 50 - 5
                        cp get_piece_pos knight_eval_pos 
                        call get_piece get_piece_return 
                        be knight_eval_fwd2d2 get_piece_isEmpty num1 
                        be knight_eval_esc playercolor get_piece_color
                        
knight_eval_fwd2d2		cpta knight_eval_pos possible_moves possible_moves_size		// add move to end of possible moves array
			               add possible_moves_size	possible_moves_size num1		// update possible moves array size

knight_eval_esc		   ret knight_eval_return



knight_eval_pos		.data 0
knight_eval_mod5    	.data 0								// This will store boardpos%5
knight_eval_mod25    	.data 0								// This will store boardpos%25
knight_eval_return	.data 0
