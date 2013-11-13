//Checks the click to see if it was a legal move i.e. in the possible_moves array
check_legal	cp	check_legal_move	num0
		cp	check_legal_index	num0
		be	check_legal_end		possible_moves_size	num0
check_loop	cpfa	check_legal_cur		possible_moves		check_legal_index
		be	check_match		selected		check_legal_cur
		add	check_legal_index	check_legal_index	num1
		blt	check_loop		check_legal_index	possible_moves_size

check_legal_end	ret	check_legal_return
		
check_match	cp	check_legal_move	num1
		ret	check_legal_return

check_legal_cur		.data	0
check_legal_index	.data	0
check_legal_return	.data	0
check_legal_move	.data	0
