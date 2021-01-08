 The data shows the average bank before and after the poker game per unit of count. Regression demonstrates the relations between bank after and bank before the game.

 forvalues b = 1/10 {
  2.     display `b'
  3.  }
1
2
3
4
5
6
7
8
9
10
 import delimited "/Users/zhannamarch/Downloads/zhanna2/2020-06-15.csv"
(69 vars, 222,396 obs)


 regress bank_after bank_before 

      Source |       SS           df       MS      Number of obs   =   222,396
-------------+----------------------------------   F(1, 222394)    >  99999.00
       Model |   214853568         1   214853568   Prob > F        =    0.0000
    Residual |  19232216.6   222,394  86.4781272   R-squared       =    0.9178
-------------+----------------------------------   Adj R-squared   =    0.9178
       Total |   234085785   222,395  1052.56766   Root MSE        =    9.2994

------------------------------------------------------------------------------
  bank_after |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
 bank_before |    1.10437   .0007006  1576.22   0.000     1.102997    1.105743
       _cons |   .7298269   .0204053    35.77   0.000     .6898331    .7698207
------------------------------------------------------------------------------

. putexcel set Book1.xlsx, sheet(sheet1) replace
Note: file will be replaced when the first putexcel command is issued
putexcel A1 = "coefficient"
file Book1.xlsx saved

histogram bank_after
(bin=53, start=.03, width=35.835659)
 graph export "/Users/zhannamarch/Downloads/zhanna2/Graph2.pdf", as(pdf) name("Graph")
(file /Users/zhannamarch/Downloads/zhanna2/Graph2.pdf written in PDF format)

 save "/Users/zhannamarch/Downloads/zhanna2/Reshaped2.dta", replace
file /Users/zhannamarch/Downloads/zhanna2/Reshaped2.dta saved
. ssc install outreg
checking outreg consistency and verifying not already installed...
installing into /Users/zhannamarch/Library/Application Support/Stata/ado/plus/...
installation complete.
 ssc install outreg2
checking outreg2 consistency and verifying not already installed...
installing into /Users/zhannamarch/Library/Application Support/Stata/ado/plus/...
installation complete.

 outreg2 using regression_results, replace excel dec(4)
regression_results.xml
dir : seeout

. seeout using "regression_results.txt"
Hit Enter to continue. 
. codebook bank_after

--------------------------------------------------------------------------------------------------------------------------------------------
bank_after                                                                                                                       (unlabeled)
--------------------------------------------------------------------------------------------------------------------------------------------

                  type:  numeric (float)

                 range:  [.03,1899.32]                units:  .01
         unique values:  1,864                    missing .:  0/222,396

                  mean:   8.99971
              std. dev:   32.4433

           percentiles:        10%       25%       50%       75%       90%
                               .07        .2       .79         7        20

. describe

Contains data
  obs:       222,396                          
 vars:            69                          
--------------------------------------------------------------------------------------------------------------------------------------------
              storage   display    value
variable name   type    format     label      variable label
--------------------------------------------------------------------------------------------------------------------------------------------
hand_prefix     str8    %9s                   
hand_id         str14   %14s                  
type1           str16   %16s                  
type2           float   %9.0g                 
type3           float   %9.0g                 
currency        str3    %9s                   
table_id        int     %8.0g                 
max_table       str5    %9s                   
button_id       str2    %9s                   
my_card_11      str1    %9s                   
my_card_12      str1    %9s                   
my_card_21      str1    %9s                   
my_card_22      str1    %9s                   
my_seat_num     byte    %8.0g                 
small_blind_id  str22   %22s                  
small_blind_sum float   %9.0g                 
big_blind_id    str22   %22s                  
big_blind_sum   float   %9.0g                 
seat_1_id       str21   %21s                  Seat_1_id
seat_2_id       str22   %22s                  Seat_2_id
seat_3_id       str22   %22s                  Seat_3_id
seat_4_id       str22   %22s                  Seat_4_id
seat_5_id       str19   %19s                  Seat_5_id
seat_6_id       str22   %22s                  Seat_6_id
seat_7_id       byte    %8.0g                 Seat_7_id
seat_8_id       byte    %8.0g                 Seat_8_id
seat_9_id       byte    %8.0g                 Seat_9_id
seat_10_id      byte    %8.0g                 Seat_10_id
seat_1_in_chips float   %9.0g                 Seat_1_in_chips
seat_2_in_chips float   %9.0g                 Seat_2_in_chips
seat_3_in_chips float   %9.0g                 Seat_3_in_chips
seat_4_in_chips float   %9.0g                 Seat_4_in_chips
seat_5_in_chips float   %9.0g                 Seat_5_in_chips
seat_6_in_chips float   %9.0g                 Seat_6_in_chips
seat_7_in_chips byte    %8.0g                 Seat_7_in_chips
seat_8_in_chips byte    %8.0g                 Seat_8_in_chips
seat_9_in_chips byte    %8.0g                 Seat_9_in_chips
seat_10_in_ch~s byte    %8.0g                 Seat_10_in_chips
flop_11         str1    %9s                   FLOP_11
flop_12         str1    %9s                   FLOP_12
flop_21         str1    %9s                   FLOP_21
flop_22         str1    %9s                   FLOP_22
flop_31         str1    %9s                   FLOP_31
flop_32         str1    %9s                   FLOP_32
turn_11         str1    %9s                   TURN_11
turn_12         str1    %9s                   TURN_12
river_11        str1    %9s                   RIVER_11
river_12        str1    %9s                   RIVER_12
num_of_step     byte    %8.0g                 
stage           str8    %9s                   
user_step_id    str22   %22s                  
action_type     str9    %9s                   
bank_before     float   %9.0g                 
action_sum      float   %9.0g                 
bank_after      float   %9.0g                 
show_card_11    str1    %9s                   
show_card_12    str1    %9s                   
show_card_21    str1    %9s                   
show_card_22    str1    %9s                   
result_seat1    float   %9.0g                 
result_seat2    float   %9.0g                 
result_seat3    float   %9.0g                 
result_seat4    float   %9.0g                 
result_seat5    float   %9.0g                 
result_seat6    byte    %8.0g                 
result_seat7    byte    %8.0g                 
result_seat8    byte    %8.0g                 
result_seat9    byte    %8.0g                 
result_seat10   byte    %8.0g                 
--------------------------------------------------------------------------------------------------------------------------------------------
Sorted by: 
     Note: Dataset has changed since last saved.
. display missing(bank_after)
0



