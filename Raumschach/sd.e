//Read data from SD
sd_read		out 82 num0
		out 83 sd_address_low
		out 84 sd_address_high
		out 80 num1

//Wait for response ready signaled
sd_resp_wait1	in 81 sd_response
		bne sd_resp_wait1 sd_response num1

//Read in data
		in 86 sd_data_read

//command signal -> 0
		out 80 num0

//Wait for response finished signaled
sd_resp_wait2	in 81 sd_response
		bne sd_resp_wait2 sd_response num0

//Go to back to previous location
sdd_return	ret sd_return

sd_response	.data 0
sd_address_low	.data 0
sd_address_high	.data 0
sd_data_read	.data 0
sd_return	.data 0
