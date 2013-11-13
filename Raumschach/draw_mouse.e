//check if mouse pixel is already drawn/not been moved
//turn pixel where the cursor is to red
draw_mouse		be draw_mouse_skip draw_mouse_drawn num0
			bne draw_mouse_cont draw_mouse_oldx mouse_driver_x
			be draw_mouse_done draw_mouse_oldy mouse_driver_y
draw_mouse_cont		cp vga_x2 num0
			cp vga_y2 num0
			cp draw_mouse_index num0
//change previous location back to original pixel colour
//add changes in coordinates to previous location
//make this new pixel red and update location of cursor
draw_mouse_redraw	cpfa vga_color_write draw_mouse_oldcolors draw_mouse_index
			cp vga_x1 draw_mouse_oldx
			cp vga_y1 draw_mouse_oldy
			call vga_set_color vga_return
			add draw_mouse_index draw_mouse_index num1
			
			cpfa vga_color_write draw_mouse_oldcolors draw_mouse_index
			add vga_x1 vga_x1 num1
			call vga_set_color vga_return
			add draw_mouse_index draw_mouse_index num1

			cpfa vga_color_write draw_mouse_oldcolors draw_mouse_index
			add vga_y1 vga_y1 num1
			sub vga_x1 vga_x1 num1
			call vga_set_color vga_return
			add draw_mouse_index draw_mouse_index num1

			cpfa vga_color_write draw_mouse_oldcolors draw_mouse_index
			add vga_x1 vga_x1 num1
			call vga_set_color vga_return

draw_mouse_skip		cp draw_mouse_drawn num1
			cp draw_mouse_oldx mouse_driver_x
			cp draw_mouse_oldy mouse_driver_y
			cp draw_mouse_index num0
			
			cp vga_x1 draw_mouse_oldx
			cp vga_y1 draw_mouse_oldy
			call vga_read vga_return
			cpta vga_color_read draw_mouse_oldcolors draw_mouse_index
			add draw_mouse_index draw_mouse_index num1
			
			add vga_x1 vga_x1 num1
			call vga_read vga_return
			cpta vga_color_read draw_mouse_oldcolors draw_mouse_index
			add draw_mouse_index draw_mouse_index num1

			add vga_y1 vga_y1 num1
			sub vga_x1 vga_x1 num1
			call vga_read vga_return
			cpta vga_color_read draw_mouse_oldcolors draw_mouse_index
			add draw_mouse_index draw_mouse_index num1

			add vga_x1 vga_x1 num1
			call vga_read vga_return
			cpta vga_color_read draw_mouse_oldcolors draw_mouse_index

			cp vga_x1 mouse_driver_x
			cp vga_y1 mouse_driver_y
			add vga_x2 vga_x1 num1
			add vga_y2 vga_y1 num1
			cp vga_color_write num224
			call vga_set_color vga_return

draw_mouse_done		ret draw_mouse_return

draw_mouse_return	.data 0
draw_mouse_drawn	.data 0
draw_mouse_oldx		.data 0
draw_mouse_oldy		.data 0
draw_mouse_index	.data 0
draw_mouse_oldcolors	.data 0
			.data 0
			.data 0
			.data 0
