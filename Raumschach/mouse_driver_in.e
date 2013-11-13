// Gets input from the mouse

mouse_driver_in_request_input   	out   	 70   					num1 // request input from mouse
mouse_driver_in_wait_for_mouse   	in   	 71   					mouse_driver_in_response // receive input
   					bne   	 mouse_driver_in_wait_for_mouse		mouse_driver_in_response    num1 // wait for input

mouse_driver_in_received		in   	 72   					mouse_driver_in_deltax // update change in x
					in   	 73   					mouse_driver_in_deltay // update change in y
					in   	 74   					mouse_driver_in_button1 // update left click
					in   	 75   					mouse_driver_in_button2 // update right click
					in   	 76   					mouse_driver_in_button3 // update center click
					out   	 70   					num0 // acknowledge receipt of input

mouse_driver_in_wait_for_mouse0   	in   	 71   					mouse_driver_in_response // wait for mouse to respond
   					bne   	 mouse_driver_in_wait_for_mouse0	mouse_driver_in_response    num0
mouse_driver_in_done   			ret   	 mouse_driver_in_return
    
mouse_driver_in_response    	 .data	0
mouse_driver_in_deltax   	 .data	0
mouse_driver_in_deltay   	 .data	0
mouse_driver_in_button1   	 .data	0
mouse_driver_in_button2   	 .data	0
mouse_driver_in_button3   	 .data	0
mouse_driver_in_return		 .data  0
