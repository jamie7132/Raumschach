//Given border_pos (a position on the board), determines which directions a piece cannot movein. Using this, permissions are turned off which the king, queen, rook, bish and uni

border_check   		   	cp for_permission num1				//Set all the permissions to active
                           cp back_permission num1
                           cp left_permission num1
                           cp right_permission num1
                           cp down_permission num1
                           cp up_permission num1
                           cp ufr_permission num1
                           cp ubr_permission num1
                           cp ufl_permission num1
                           cp ubl_permission num1
                           cp dfr_permission num1
                           cp dbr_permission num1
                           cp dfl_permission num1
                           cp dbl_permission num1
                           cp uf_permission num1
                           cp ub_permission num1
                           cp ur_permission num1
                           cp ul_permission num1
                           cp df_permission num1
                           cp db_permission num1
                           cp dr_permission num1
                           cp dl_permission num1
                           cp fr_permission num1
                           cp fl_permission num1
                           cp br_permission num1
                           cp bl_permission num1


border_check_choose        be border_check_dfl border_pos num0			//If a player is at a border position, go to the designated label
                           be border_check_fl border_pos num1
                           be border_check_fl border_pos num2
                           be border_check_fl border_pos num3
                           be border_check_ufl border_pos num4
                           be border_check_fd border_pos num5
                           be border_check_fd border_pos num10
                           be border_check_fd border_pos num15
                           be border_check_f border_pos num6
                           be border_check_f border_pos num7
                           be border_check_f border_pos num8
                           be border_check_f border_pos num11
                           be border_check_f border_pos num12
                           be border_check_f border_pos num13
                           be border_check_f border_pos num16
                           be border_check_f border_pos num17
                           be border_check_f border_pos num18
                           be border_check_uf border_pos num9
                           be border_check_uf border_pos num14
                           be border_check_uf border_pos num19
                           be border_check_dfr border_pos num20
                           be border_check_fr border_pos num21
                           be border_check_fr border_pos num22
                           be border_check_fr border_pos num23
                           be border_check_ufr border_pos num24
                           be border_check_dl border_pos num25
                           be border_check_dl border_pos num50
                           be border_check_dl border_pos num75
                           be border_check_l border_pos num26
                           be border_check_l border_pos num27
                           be border_check_l border_pos num28
                           be border_check_l border_pos num51
                           be border_check_l border_pos num52
                           be border_check_l border_pos num53
                           be border_check_l border_pos num76
                           be border_check_l border_pos num77
                           be border_check_l border_pos num78
                           be border_check_ul border_pos num29 
                           be border_check_ul border_pos num54
                           be border_check_ul border_pos num79
                           be border_check_d border_pos num30
                           be border_check_d border_pos num35
                           be border_check_d border_pos num40                                
                           be border_check_d border_pos num55
                           be border_check_d border_pos num60
                           be border_check_d border_pos num65
                           be border_check_d border_pos num80
                           be border_check_d border_pos num85
                           be border_check_d border_pos num90
                           be border_check_u border_pos num34
                           be border_check_u border_pos num39
                           be border_check_u border_pos num44
                           be border_check_u border_pos num59
                           be border_check_u border_pos num64
                           be border_check_u border_pos num69
                           be border_check_u border_pos num84
                           be border_check_u border_pos num89
                           be border_check_u border_pos num94
                           be border_check_dr border_pos num45
                           be border_check_dr border_pos num70
                           be border_check_dr border_pos num95
                           be border_check_r border_pos num46
                           be border_check_r border_pos num47
                           be border_check_r border_pos num48
                           be border_check_r border_pos num71
                           be border_check_r border_pos num72
                           be border_check_r border_pos num73
                           be border_check_r border_pos num96
                           be border_check_r border_pos num97
                           be border_check_r border_pos num98
                           be border_check_ur border_pos num49
                           be border_check_ur border_pos num74
                           be border_check_ur border_pos num99
                           be border_check_dbl border_pos num100
                           be border_check_bl border_pos num101
                           be border_check_bl border_pos num102
                           be border_check_bl border_pos num103
                           be border_check_ubl border_pos num104 
                           be border_check_bd border_pos num105
                           be border_check_bd border_pos num110
                           be border_check_bd border_pos num115
                           be border_check_b border_pos num106
                           be border_check_b border_pos num107
                           be border_check_b border_pos num108
                           be border_check_b border_pos num111
                           be border_check_b border_pos num112
                           be border_check_b border_pos num113
                           be border_check_b border_pos num116
                           be border_check_b border_pos num117
                           be border_check_b border_pos num118
                           be border_check_ub border_pos num109
                           be border_check_ub border_pos num114
                           be border_check_ub border_pos num119
                           be border_check_dbr border_pos num120
                           be border_check_br border_pos num121
                           be border_check_br border_pos num122
                           be border_check_br border_pos num123
                           be border_check_ubr border_pos num124
                           ret border_check_return								//If not at a border, return
                                                
border_check_dfl           cp for_permission num0								//Turn off permissions directions that a piece cannot move to based on their current position
                           cp down_permission num0
                           cp left_permission num0
                           cp dfl_permission num0
                           cp dfr_permission num0          
									cp dbr_permission num0         
									cp	dbl_permission num0
									cp ufr_permission num0         
									cp ufl_permission num0         
									cp ubl_permission num0         
                           cp fl_permission num0
                           cp df_permission num0
                           cp dl_permission num0
                           cp db_permission num0
                           cp uf_permission num0           
                           cp ul_permission num0                      
                           cp dr_permission num0           
                           cp fr_permission num0           
                           cp bl_permission num0           
									ret border_check_return							//return


border_check_fl            cp for_permission num0
                           cp left_permission num0
                           cp ufr_permission num0
                           cp ufl_permission num0
									cp ubl_permission num0          
									cp dfr_permission num0
									cp dfl_permission num0          
									cp dbl_permission num0
									cp fr_permission num0
									cp fl_permission num0         
									cp uf_permission num0           
									cp df_permission num0  
									cp ul_permission num0           
									cp dl_permission num0
									cp bl_permission num0
									cp df_permission num0
									ret border_check_return


border_check_ufl           cp for_permission num0
                           cp up_permission num0
                           cp left_permission num0
                           cp ufl_permission num0
                           cp ubr_permission num0
									cp ubl_permission num0
									cp ufr_permission num0
									cp dfr_permission num0          
									cp dfl_permission num0          
									cp dbl_permission num0
                           cp fl_permission num0
                           cp uf_permission num0
                           cp ul_permission num0
									cp ub_permission num0 
									cp ur_permission num0           
									cp df_permission num0           
									cp dl_permission num0           
									cp fr_permission num0           
									cp bl_permission num0
									ret border_check_return


border_check_fd            cp for_permission num0
                           cp down_permission num0
                           cp ufr_permission num0
									cp ufl_permission num0
									cp dfr_permission num0          
									cp dbr_permission num0          
									cp dfl_permission num0          
									cp dbl_permission num0
                           cp df_permission num0
									cp uf_permission num0
									cp db_permission num0           
									cp dr_permission num0           
									cp dl_permission num0           
									cp fr_permission num0           
									cp fl_permission num0           
									ret border_check_return


border_check_f             cp for_permission num0
									cp ufr_permission num0          
									cp dfr_permission num0          
									cp dfl_permission num0 
									cp ufl_permission num0         
									cp uf_permission num0           
									cp df_permission num0           
									cp fr_permission num0           
									cp fl_permission num0           
									ret border_check_return


border_check_uf            cp for_permission num0
									cp ufr_permission num0          
									cp ubr_permission num0          
									cp ufl_permission num0          
									cp ubl_permission num0          
									cp dfr_permission num0          
									cp dfl_permission num0          
									cp ub_permission num0           
									cp ur_permission num0           
									cp ul_permission num0           
									cp df_permission num0           
									cp fr_permission num0           
									cp fl_permission num0           
                           cp up_permission num0
                           cp uf_permission num0
                           ret border_check_return


border_check_dfr           cp for_permission num0
                           cp down_permission num0
                           cp right_permission num0
                           cp dfr_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp df_permission num0
                           cp fr_permission num0
                           cp dr_permission num0      
                           cp uf_permission num0           
                           cp ur_permission num0   
                           cp db_permission num0           
                           cp dl_permission num0           
                           cp fl_permission num0           
                           cp br_permission num0           
                           ret border_check_return


border_check_fr            cp for_permission num0
                           cp right_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp uf_permission num0           
                           cp ur_permission num0           
                           cp df_permission num0           
                           cp dr_permission num0           
                           cp fl_permission num0           
                           cp br_permission num0           
                           cp fr_permission num0
                           ret border_check_return


border_check_ufr           cp for_permission num0
                           cp up_permission num0
                           cp right_permission num0
                           cp fr_permission num0
                           cp uf_permission num0
                           cp ur_permission num0
                           cp ufr_permission num0
                           ret border_check_return


border_check_dl            cp down_permission num0
                           cp left_permission num0
                           cp dl_permission num0
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0          
                           cp ufl_permission num0          
                           cp ubl_permission num0          
                           cp ul_permission num0           
                           cp df_permission num0           
                           cp db_permission num0           
                           cp dr_permission num0           
                           cp fl_permission num0 
                           cp bl_permission num0 
                           ret border_check_return

border_check_l             cp left_permission num0
									cp ufl_permission num0          
									cp ubl_permission num0          
									cp dfl_permission num0          
									cp dbl_permission num0          
									cp ul_permission num0           
									cp dl_permission num0           
									cp fl_permission num0           
									cp bl_permission num0           
                           ret border_check_return


border_check_ul            cp up_permission num0
                           cp left_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp ubl_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0     
                           cp uf_permission num0           
                           cp ub_permission num0           
                           cp ur_permission num0           
                           cp dl_permission num0           
                           cp fl_permission num0           
                           cp bl_permission num0           
     								cp ul_permission num0
                         	ret border_check_return

border_check_d             cp down_permission num0
									cp dfr_permission num0          
									cp dbr_permission num0          
									cp dfl_permission num0          
									cp dbl_permission num0          
									cp df_permission num0           
									cp db_permission num0           
									cp dr_permission num0           
									cp dl_permission num0           
                           ret border_check_return


border_check_u             cp up_permission num0
									cp ufr_permission num0          
									cp ubr_permission num0          
									cp ufl_permission num0          
									cp ubl_permission num0          
									cp uf_permission num0           
									cp ub_permission num0           
									cp ur_permission num0           
									cp ul_permission num0           
                           ret border_check_return


border_check_dr            cp down_permission num0
                           cp right_permission num0
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0          
                           cp ur_permission num0           
                           cp df_permission num0           
                           cp db_permission num0           
                           cp dr_permission num0           
                           cp dl_permission num0           
                           cp fr_permission num0           
                           cp br_permission num0           
                           cp dr_permission num0
                           ret border_check_return


border_check_r             cp right_permission num0
									cp ufr_permission num0          
									cp ubr_permission num0          
									cp dfr_permission num0          
									cp dbr_permission num0          
									cp ur_permission num0 
									cp dr_permission num0 
									cp fr_permission num0
									cp br_permission num0
                           ret border_check_return


border_check_ur            cp up_permission num0
                           cp right_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp uf_permission num0           
                           cp ub_permission num0           
                           cp ul_permission num0           
                           cp dr_permission num0           
                           cp fr_permission num0           
                           cp br_permission num0    
                           cp ur_permission num0
                           ret border_check_return

border_check_dbl           cp back_permission num0
                           cp down_permission num0
                           cp left_permission num0
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0 
                           cp dbl_permission num0
                           cp db_permission num0
                           cp bl_permission num0
                           cp dl_permission num0
                           cp ub_permission num0           
                           cp ul_permission num0           
                           cp dr_permission num0
                           cp fl_permission num0           
                           cp br_permission num0           
                           ret border_check_return


border_check_bl            cp back_permission num0
                           cp left_permission num0
                           cp ubr_permission num0          
                           cp ubl_permission num0          
                           cp dbr_permission num0          
                           cp dbl_permission num0 
                           cp dfl_permission num0          
                           cp ufl_permission num0                  
                           cp ub_permission num0           
                           cp ul_permission num0           
                           cp db_permission num0           
                           cp dl_permission num0           
                           cp fl_permission num0           
                           cp br_permission num0                                     
                           cp bl_permission num0
                           ret border_check_return

border_check_ubl           cp back_permission num0
                           cp up_permission num0
                           cp left_permission num0
                           cp ufr_permission num0          
                           cp ubl_permission num0
                           cp ubr_permission num0          
                           cp ufl_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0          
                           cp uf_permission num0           
                           cp ur_permission num0           
                           cp db_permission num0           
                           cp dl_permission num0           
                           cp fl_permission num0           
                           cp br_permission num0           
                           cp ub_permission num0
                           cp bl_permission num0
                           cp ul_permission num0
                           ret border_check_return


border_check_bd            cp back_permission num0
                           cp down_permission num0
                           cp ubr_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0          
                           cp ub_permission num0
                           cp df_permission num0
                           cp dr_permission num0           
                           cp dl_permission num0 
                           cp br_permission num0           
                           cp bl_permission num0 
                           cp db_permission num0
                           ret border_check_return


border_check_b             cp back_permission num0
									cp ubr_permission num0          
									cp ubl_permission num0          
									cp dbr_permission num0          
									cp dbl_permission num0
									cp ub_permission num0 
									cp db_permission num0
									cp br_permission num0           
									cp bl_permission num0
                           ret border_check_return


border_check_ub            cp back_permission num0
									cp ufr_permission num0          
									cp ubr_permission num0          
									cp ufl_permission num0          
									cp ubl_permission num0          
									cp dbr_permission num0          
									cp dbl_permission num0          
									cp uf_permission num0           
									cp ur_permission num0           
									cp ul_permission num0           
									cp db_permission num0           
									cp br_permission num0           
									cp bl_permission num0           
                           cp up_permission num0
                           cp ub_permission num0
                           ret border_check_return

border_check_dbr           cp back_permission num0
                           cp down_permission num0
                           cp right_permission num0
                           cp dbr_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dfl_permission num0          
                           cp dbl_permission num0          
                           cp ub_permission num0           
                           cp ur_permission num0           
                           cp df_permission num0  
                           cp dl_permission num0           
                           cp fr_permission num0           
                           cp bl_permission num0           
                           cp db_permission num0
                           cp br_permission num0
                           cp dr_permission num0
                           ret border_check_return

border_check_br            cp back_permission num0
                           cp right_permission num0
                           cp ufr_permission num0          
                           cp ubr_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dbl_permission num0 
                           cp ub_permission num0           
                           cp ur_permission num0           
                           cp db_permission num0           
                           cp dr_permission num0           
                           cp fr_permission num0           
                           cp bl_permission num0           
                           cp br_permission num0
                           ret border_check_return


border_check_ubr           cp back_permission num0
                           cp up_permission num0
                           cp right_permission num0
                           cp ubr_permission num0
                           cp ufr_permission num0          
                           cp ufl_permission num0          
                           cp ubl_permission num0          
                           cp dfr_permission num0          
                           cp dbr_permission num0          
                           cp dbl_permission num0          
                           cp uf_permission num0           
                           cp ul_permission num0           
                           cp db_permission num0           
                           cp dr_permission num0           
                           cp fr_permission num0           
                           cp bl_permission num0           
                           cp ub_permission num0
                           cp br_permission num0
                           cp ur_permission num0
                           ret border_check_return

border_pos					.data 0
border_check_return     .data 0
for_permission          .data 1
back_permission         .data 1
left_permission         .data 1
right_permission        .data 1
down_permission         .data 1
up_permission           .data 1
ufr_permission          .data 1
ubr_permission          .data 1
ufl_permission          .data 1
ubl_permission          .data 1
dfr_permission          .data 1
dbr_permission          .data 1
dfl_permission          .data 1
dbl_permission          .data 1
uf_permission           .data 1
ub_permission           .data 1
ur_permission           .data 1
ul_permission           .data 1
df_permission           .data 1
db_permission           .data 1
dr_permission           .data 1
dl_permission           .data 1
fr_permission           .data 1
fl_permission           .data 1
br_permission           .data 1
bl_permission           .data 1
