%option main
digit [0-9]
sign [+-]
letter [a-zA-Z\_]
num {sign}?{digit}*(\.)?{digit}+
identifier {letter}({letter}|{digit})*
comment_start \/\* 
comment_end   \*\/
string \".*\"
%%

begin printf("BEGIN ");
end   printf("END ");

\( printf("LP ");
\) printf("RP ");
\{ printf("LCB ");
\} printf("RCB ");
\; printf("SEMICOLON ");
\, printf("COMMA ");

{num} printf("NUM ");
{string} printf("STRING ");

\= printf("ASSIGNMENT_OP ");
\- printf("MINUS ");
\+ printf("PLUS ");
\* printf("TIMES "); 

{comment_start}.*{comment_end} printf("COMMENT ");

\=\= printf("EQUAL_OP ");
\!\= printf("NOT_EQUAL_OP ");
\>  printf("GREATER_OP");
\<  printf("LESS_OP");
\<\= printf("LESS_EQUAL_OP ");
\>\= printf("GREATER_EQUAL_OP");

if printf("IF ");
else printf("ELSE ");
for printf("FOR ");
do printf("DO ");
while printf("WHILE ");
return printf("RETURN ");
func printf("FUNCTION ");

\_\_scan printf("INPUT_FUNC ");
\_\_print printf("OUTPUT_FUNC ");
\_\_switch_camera printf("CAMERA_ON_OFF_FUNC ");
\_\_take_picture printf("PHOTO_FUNC ");
\_\_timer_start printf("TIMER_START_FUNC ");
\_\_timer_stop printf("TIMER_STOP_FUNC ");
\_\_timer_time printf("TIMER_TIME_FUNC ");
\_\_connect printf("CONNECT_FUNC ");
\_\_disconnect printf("DISCONNECT_FUNC ");
__up printf("UP_FUNC ");
__forward printf("FORWARD_FUNC ");
__left printf("LEFT_FUNC ");
__right printf("RIGHT_FUNC ");
__back printf("BACK_FUNC ");
__down printf("DOWN_FUNC ");
__rotate_left printf("ROTATE_LEFT_FUNC ");
__rotate_right printf("ROTATE_RIGHT_FUNC ");
__back_flip printf("BACK_FLIP_FUNC ");
__front_flip printf("FRONT_FLIP_FUNC ");
__right_flip printf("RIGHT_FLIP_FUNC ");
__left_flip printf("LEFT_FLIP_FUNC ");
__land printf("LAND_FUNC ");


\_\_incline printf("INCLINE_VAR " );
\_\_altitude printf("ALTITUDE_VAR ");
\_\_temperature printf("TEMPERATURE_VAR ");
\_\_acceleration printf("ACCELERATION_VAR ");
\_\_connection printf("CONNECTION_VAR ");

{identifier} printf("IDENTIFIER ");
