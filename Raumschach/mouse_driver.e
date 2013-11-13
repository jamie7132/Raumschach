// Tracks mouse position

mouse_driver			   	 call    mouse_driver_in_request_input   	mouse_driver_in_return // get input from mouse
   					 add   	 mouse_driver_x   			mouse_driver_x   		 mouse_driver_in_deltax // update x position
   					 blt   	 mouse_driver_maxx   			num639		   		 mouse_driver_x // stay inside screen
		   		 	 blt   	 mouse_driver_minx   			mouse_driver_x   		 num0 //stay inside screen
    
mouse_driver_y1   		 	 add   	 mouse_driver_y   	mouse_driver_y   		 mouse_driver_in_deltay // update y position
   					 blt   	 mouse_driver_maxy   			num479   		 	 mouse_driver_y // stay inside screen
		   		 	 blt   	 mouse_driver_miny   			mouse_driver_y   		 num0 // stay inside screen
mouse_driver_checkclick		 	 call 	 draw_mouse 				draw_mouse_return // display cursor
					 be   	 mouse_driver_esc			mouse_driver_in_button1   	 num1 // return when the mouse is clicked
   					 be   	 mouse_driver   			0   				 0 // loop back to update the position again

mouse_driver_esc   	 		 ret   	 mouse_driver_return

mouse_driver_maxx			 cp   	 mouse_driver_x   					 num639 // width of screen
   					 be   	 mouse_driver_y1   					 0   						 0

mouse_driver_maxy			 cp   	 mouse_driver_y   					 num479 // height of screen
   					 be   	 mouse_driver_checkclick   				 0   						 0

mouse_driver_minx			 cp   	 mouse_driver_x   					 num0 // minimum horizontal pixel value
   					 be   	 mouse_driver_y1   					 0   						 0

mouse_driver_miny			 cp   	 mouse_driver_y   					 num0 // minumum vertical pixel value
   					 be   	 mouse_driver_checkclick				 0   						 0
    
mouse_driver_x   	.data 0
mouse_driver_y   	.data 0
mouse_driver_return	.data 0
