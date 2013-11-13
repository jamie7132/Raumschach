//White := 0, Black := 1

change_player 		be change_to_white playercolor num1			//if black, go to change_to_white
         			cp playercolor num1 		   					//if white change to black
						cp vga_x1 num1
						cp vga_y1 num41
						cp vga_x2 num109
						cp vga_y2 num79
						cp vga_color_write num0
						call vga_set_color vga_return
         			ret change_player_return

change_to_white 	cp playercolor num0								//change from black to white
						cp vga_x1 num1
						cp vga_y1 num41
						cp vga_x2 num109
						cp vga_y2 num79
						cp vga_color_write num255
						call vga_set_color vga_return
						ret change_player_return

change_player_return	.data 0
