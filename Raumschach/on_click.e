// Finds the selected (the index of the selected square) and selected_piece
// (the number of the piece in that square, or 0 for no piece) selected based on the mouse position
// Finds the row, column, and level number from 1 to 5 (0 indicates that there is none selected.)
// Returns -1 for selected if no new piece is selected.
// Rows are numbered from FRONT TO BACK, columns from LEFT TO RIGHT, and levels from TOP TO BOTTOM.

on_click		call    mouse_driver    mouse_driver_return
			blt     onclick_cont	num110		mouse_driver_x
			blt	onclick_cont	num40		mouse_driver_y
			call	reset_board	reset_board_return


// Determine which level was selected
onclick_cont		blt	onclick_lvl0	mouse_driver_y	num10
onclick_check_lvl5	blt	onclick_lvl1	mouse_driver_y	num95
               		blt	onclick_lvl0	mouse_driver_y	num105
onclick_check_lvl4	blt	onclick_lvl2	mouse_driver_y	num190
               		blt	onclick_lvl0	mouse_driver_y	num200
onclick_check_lvl3	blt	onclick_lvl3	mouse_driver_y	num285
               		blt	onclick_lvl0	mouse_driver_y	num295
onclick_check_lvl2	blt	onclick_lvl4	mouse_driver_y	num380
               		blt	onclick_lvl0	mouse_driver_y	num390
onclick_check_lvl1	blt	onclick_lvl5	mouse_driver_y	num475
               		blt	onclick_lvl0	mouse_driver_y	num9000
// mouse_pos should never exceed the height of the window, 480px, but 9000 leaves room for error.


// update level
onclick_lvl1           	cp	selected_lvl    	num1
               		be	onclick_check_row	0	0

onclick_lvl2           	cp	selected_lvl    	num2
               		be	onclick_check_row	0	0

onclick_lvl3	  	cp	selected_lvl    	num3
			be	onclick_check_row	0	0

onclick_lvl4     	cp	selected_lvl    	num4
               		be	onclick_check_row	0	0

onclick_lvl5	 	cp	selected_lvl    	num5
			be	onclick_check_row	0	0
//No level selected
onclick_lvl0	       	cp	selected_lvl		num0 //This line is just a precaution, since selected_lvl is set to 0 by default.
               		ret	on_click_return


// Find which row is selected
// onclick_ypos = mouse_driver_y - 95(selected_lvl-1) gives mouse position relative to the top of the selected level
onclick_check_row     	sub    	onclick_tmp    	selected_lvl	num1
               		mult	onclick_tmp    	onclick_tmp    	num95
		       	sub    	onclick_tmp    	mouse_driver_y    	onclick_tmp
		       	cp    	onclick_ypos	onclick_tmp
		       	blt    	onclick_row0	onclick_ypos	num10 // We should not end up in row0 a nonexistent row, because row should catch anything outside the vertical bounds of the rows and levels.


// Find which row is selected
onclick_check_row1	blt    	onclick_row5	onclick_ypos	num27
onclick_check_row2	blt    	onclick_row4	onclick_ypos	num44
onclick_check_row3	blt    	onclick_row3	onclick_ypos	num61
onclick_check_row4	blt    	onclick_row2	onclick_ypos	num78
onclick_check_row5	blt    	onclick_row1	onclick_ypos	num95
               		blt    	onclick_row0	onclick_ypos	num9000

// onclick_ypos should never exceed 105, but 9000 leaves room for error.
onclick_row1	       	cp	selected_row    	num1
		       	be	onclick_check_col	0    	0

onclick_row2	       	cp	selected_row    	num2
		       	be	onclick_check_col	0    	0

onclick_row3	       	cp	selected_row    	num3
		       	be	onclick_check_col	0    	0

onclick_row4	       	cp	selected_row    	num4
		       	be	onclick_check_col	0    	0

onclick_row5	       	cp	selected_row    	num5
		       	be	onclick_check_col	0    	0

// No row was selected. This is a failsafe. It should not be executed because the level checks should only branch to the row checks if the mouse is within a level, and consequently within a row.
onclick_row0	       	cp	selected_row    	num0 // Default value is already 0, so this is just a precaution.
		       	ret	on_click_return
              	 

//Finds which column is selected
//onclick_xpos	= mouse_driver_x - 120 - 20(selected_row) shifts horizontal position to correct for skew for simpler boundaries
onclick_check_col	mult	onclick_tmp    	selected_row   	num20
		       	sub	onclick_xpos	mouse_driver_x  num120
			sub	onclick_xpos 	onclick_xpos	onclick_tmp


//Find which column is selected
	      	 	blt    	onclick_col0	onclick_xpos	num0
onclick_check_col1	blt    	onclick_col1	onclick_xpos	num40
               		blt    	onclick_col0	onclick_xpos	num60
onclick_check_col2	blt    	onclick_col2	onclick_xpos	num100
               		blt    	onclick_col0	onclick_xpos	num120
onclick_check_col3	blt    	onclick_col3	onclick_xpos	num160
               		blt    	onclick_col0	onclick_xpos	num180
onclick_check_col4	blt    	onclick_col4	onclick_xpos	num220
               		blt    	onclick_col0	onclick_xpos	num240
onclick_check_col5	blt    	onclick_col5	onclick_xpos	num280
               		blt    	onclick_col0	onclick_xpos	num9000

//Update selected column number
onclick_col1           	cp	selected_col    	num1
               		be	onclick_find_square	0    	0

onclick_col2   		cp	selected_col    	num2
               		be	onclick_find_square	0    	0

onclick_col3		cp	selected_col    	num3
		       	be	onclick_find_square	0    	0

onclick_col4		cp	selected_col    	num4
		       	be	onclick_find_square	0    	0

onclick_col5		cp	selected_col    	num5
		       	be	onclick_find_square	0    	0

// No column was selected.
onclick_col0		cp	selected_col    	num0 // Default value is already 0, so this is just a precaution.
		       	ret	on_click_return

//Uses level, row, and column to determine the board_array index of the selected square
// selected = 25(selected_row - 1) + 5(selected_col - 1) + (5 - selected_lvl)
onclick_find_square 	sub   	onclick_tmp   	 	selected_row    	num1
			mult    onclick_tmp   	 	onclick_tmp   	 	num25
			sub   	onclick_tmp2    	selected_col    	num1
			mult    onclick_tmp2    	onclick_tmp2    	num5
			add   	onclick_tmp   	 	onclick_tmp   	 	onclick_tmp2
			add   	onclick_tmp   	 	onclick_tmp   	 	num5
			sub   	selected   	 	onclick_tmp   	 	selected_lvl				 
               		cpfa	selected_piece 		board_start    		selected

               		ret	on_click_return	

on_click_return	.data	0
onclick_xpos	.data	0
onclick_ypos	.data	0
selected    	.data	0
selected_piece	.data	0
selected_lvl	.data	0 
selected_row	.data	0
selected_col	.data	0
onclick_tmp    	.data	0
onclick_tmp2	.data	0
