//This functions converts a square number to the top left corner pixel values for drawing pieces and highlights
//Input: square_num, output: square_x, square_y
square_to_xy	cp mod_mod1 square_num
		cp mod_mod2 num5
		call mod mod_return
		cp square_level mod_modResult

		sub square_tmp1 square_num square_level
		cp mod_mod1 square_tmp1
		cp mod_mod2 num25
		call mod mod_return
		div square_col mod_modResult num5

		blt square_r0 square_num num25
		blt square_r1 square_num num50
		blt square_r2 square_num num75
		blt square_r3 square_num num100
		blt square_r4 square_num num125

square_r0	cp square_row num0
		be square_calc 0 0

square_r1	cp square_row num1
		be square_calc 0 0

square_r2	cp square_row num2
		be square_calc 0 0

square_r3	cp square_row num3
		be square_calc 0 0

square_r4	cp square_row num4
		be square_calc 0 0

square_calc	mult square_x square_col num60
		add square_x square_x num140
		mult square_tmp1 square_row num20
		add square_x square_x square_tmp1

		mult square_tmp1 square_level num95
		sub square_y num459 square_tmp1
		mult square_tmp1 square_row num17
		sub square_y square_y square_tmp1

		ret square_to_xy_return


square_num		.data 0
square_tmp1		.data 0
square_x		.data 0
square_y		.data 0
square_level 		.data 0
square_col		.data 0
square_row		.data 0
square_to_xy_return	.data 0
