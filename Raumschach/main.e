		call 	draw_board 	draw_board_return //draw the board
		call 	draw_all_pieces	draw_all_pieces_return //draw the pieces

main_loop	call 	on_click 	on_click_return //wait for click
main_p_chk	cp	boardpos	selected
		be	main_loop	selected_piece		num0 //if a square without a piece is clicked
		blt 	whitepiece	selected_piece		num8 //determine the color of the piece
		cp	piececolor	num1
colorcheck	bne	main_loop	piececolor		playercolor //make sure the piece clicked is the current player's piece
		call	piece_eval	piece_eval_return //determine the possible moves
		call	mark_on		mark_return //turn the highlights on

		call	on_click	on_click_return //wait for second click
		cp	movepos		selected
		call	check_legal	check_legal_return //see if legal move
		call	mark_off	mark_return //remove highlights
		be	main_p_chk	check_legal_move	num0 //if not a legal move go through logic above
		
		call	move_piece	move_piece_return //if legal move move the pieces
		call	draw_all_pieces	draw_all_pieces_return //redraw all the pieces

//See if anyone is in check
		cp	uprcolor	num255
		cp	lwrcolor	num255
		call	check		check_return
		be	blkchkchk	black_king_incheck	num1
chkchk2		be	whtchkchk	white_king_incheck	num1

draw_chk_sqrs	cp	vga_x1		num530
		cp	vga_y1		num1
		cp	vga_x2		num638
		cp	vga_y2		num39
		cp	vga_color_write	uprcolor
		call	vga_set_color	vga_return
		cp	vga_y1		num440
		cp	vga_y2		num478
		cp	vga_color_write	lwrcolor
		call	vga_set_color	vga_return

//Check for winner
		call	dead_king	dead_king_return
		be	b_death		dead_black_king		num1
		be	w_death		dead_white_king		num1	
		
		call	draw_mouse_skip	draw_mouse_return //redraw mouse
		call	change_player	change_player_return //change player
		be 	main_loop 	0 	0 //go back to loop
		halt //safeguard, should never get here

blkchkchk	cp	uprcolor	num224
		be	chkchk2		0	0

whtchkchk	cp	lwrcolor	num224
		be	draw_chk_sqrs	0	0

whitepiece	cp	piececolor	num0
		be	colorcheck	0	0

b_death		call	white_victory	white_victory_return
		call	draw_mouse_skip	draw_mouse_return
		be	win_loop	0	0
w_death		call	black_victory	black_victory_return
		call	draw_mouse_skip	draw_mouse_return
win_loop	call	on_click	on_click_return
		be	win_loop	0	0

uprcolor		.data 255
lwrcolor		.data 255
piececolor		.data 0
movepos			.data 0
boardpos		.data 0
playercolor		.data 0 //White := 0, Black := 1

possible_moves_size	.data 0
possible_moves		.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		   	.data 0
		    	.data 0
		   	.data 0
		   	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0
		    	.data 0

num0	.data 0
num1	.data 1
num2	.data 2
num3	.data 3
num4	.data 4
num5	.data 5
num6	.data 6
num7	.data 7
num8	.data 8
num9	.data 9
num10	.data 10
num11	.data 11
num12	.data 12
num13	.data 13
num14	.data 14
num15	.data 15
num16	.data 16
num17	.data 17
num18	.data 18
num19	.data 19
num20	.data 20
num21	.data 21
num22	.data 22
num23	.data 23
num24	.data 24
num25	.data 25
num26	.data 26
num27	.data 27
num28	.data 28
num29	.data 29
num30	.data 30
num31	.data 31
num32	.data 32
num33	.data 33
num34	.data 34
num35	.data 35
num36	.data 36
num37	.data 37
num38	.data 38
num39	.data 39
num40	.data 40
num41	.data 41
num42	.data 42
num43	.data 43
num44	.data 44
num45	.data 45
num46	.data 46
num47	.data 47
num48	.data 48
num49	.data 49
num50	.data 50
num51	.data 51
num52	.data 52
num53	.data 53
num54	.data 54
num55	.data 55
num56	.data 56
num57	.data 57
num58	.data 58
num59	.data 59
num60	.data 60
num61	.data 61
num62	.data 62
num63	.data 63
num64	.data 64
num65	.data 65
num66	.data 66
num67	.data 67
num68	.data 68
num69	.data 69
num70	.data 70
num71	.data 71
num72	.data 72
num73	.data 73
num74	.data 74
num75	.data 75
num76	.data 76
num77	.data 77
num78	.data 78
num79	.data 79
num80	.data 80
num81	.data 81
num82	.data 82
num83	.data 83
num84	.data 84
num85	.data 85
num86	.data 86
num87	.data 87
num88	.data 88
num89	.data 89
num90	.data 90
num91	.data 91
num92	.data 92
num93	.data 93
num94	.data 94
num95	.data 95
num96	.data 96
num97	.data 97
num98	.data 98
num99	.data 99
num100	.data 100
num101	.data 101
num102	.data 102
num103	.data 103
num104	.data 104
num105	.data 105
num106	.data 106
num107	.data 107
num108	.data 108
num109	.data 109
num110	.data 110
num111	.data 111
num112	.data 112
num113	.data 113
num114	.data 114
num115	.data 115
num116	.data 116
num117	.data 117
num118	.data 118
num119	.data 119
num120	.data 120
num121	.data 121
num122	.data 122
num123	.data 123
num124	.data 124
num125	.data 125
num140	.data	140	
num190	.data	190
num200	.data	200
num208	.data	208	
num285	.data	285
num295	.data	295
num380	.data	380
num390	.data	390	
num475	.data	475
num485	.data	485
num160	.data	160
num180	.data	180
num220	.data	220
num224	.data	224
num240	.data	240
num255	.data	255
num260	.data	260
num280	.data	280
num300	.data	300
num440	.data	440
num459	.data	459
num478	.data	478
num479  .data	479
num480	.data	480
num530	.data	530
num617	.data	617
num620	.data	620
num638	.data	638
num639  .data	639
num640	.data	640
num9000	.data	9000 // An arbitrary number large number for comparisons
num12288	.data 12288
num12888	.data 12888
num13488	.data 13488
num14088	.data 14088
num14688	.data 14688
num15288	.data 15288
num15888	.data 15888
num16488	.data 16488
num17088	.data 17088
num17688	.data 17688
num18288	.data 18288
num18888	.data 18888
num19488	.data 19488
num20088	.data 20088
num20688	.data 20688
num32767	.data 32767

#include b_pawn_eval.e
#include bishop_eval.e
#include black_victory.e
#include border_check.e
#include change_player.e
#include check.e
#include check_legal.e
#include dead_king.e
#include draw_all_pieces.e
#include draw_board.e
#include draw_mouse.e
#include draw_piece.e
#include get_piece.e
#include king_eval.e
#include knight_eval.e
#include mark.e
#include mod.e
#include move_piece.e
#include mouse_driver.e
#include mouse_driver_in.e
#include on_click.e
#include piece_eval.e
#include queen_eval.e
#include reset_board.e
#include rook_eval.e
#include sd.e
#include square_to_xy.e
#include unicorn_eval.e
#include vgadriver.e
#include white_victory.e
#include w_pawn_eval.e
