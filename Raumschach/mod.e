// Finds mod_mod1 % mod_mod2 and stores it in mod_modResult

mod       	sub mod_mod1 mod_mod1 mod_mod2 // Subtract mod_mod2 repeatedly to find remainder
        	blt mod_add mod_mod1 num0
        	be mod 0 0

mod_add    	add mod_modResult mod_mod1 mod_mod2 // Prevent negative results
mod_end    	ret mod_return

mod_mod1    	.data	0
mod_mod2    	.data	0
mod_modResult   .data	0
mod_return	.data 	0
