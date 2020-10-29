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

\_ printf("UNDERSCORE ");
\( printf("LP ");
\) printf("RP ");
\{ printf("LCB ");
\} printf("RCB ");
\; printf("SEMICOLON ");
\, printf("COMMA ");

final printf("FINAL ");
num printf("NUM ");
string printf("STRING ");

{num} printf("NUM_CONST ");
{string} printf("STRING_CONST ");

\= printf("ASSIGNMENT_OP ");
\- printf("MINUS ");
\+ printf("PLUS ");
\* printf("TIMES "); 
\% printf("MODULO ");

{comment_start}.*{comment_end} printf("COMMENT ");

\=\= printf("EQUAL_OP ");
\!\= printf("NOT_EQUAL_OP ");
\>  printf("GREATER_OP");
\<  printf("LESS_OP");
\<\= printf("LESS_EQUAL_OP ");
\>\= printf("GREATER_EQUAL_OP");

\&\& printf("LOGICAL_AND_OP ");
\|\| printf("LOGICAL_OR_OP ");
\! printf("LOGICAL_NOT_OP ");

if printf("IF ");
else printf("ELSE ");
for printf("FOR ");
do printf("DO ");
while printf("WHILE ");
return printf("RETURN ");
func printf("FUNCTION ");

scan printf("INPUT_FUNC ");
print printf("OUTPUT_FUNC ");
switch_camera printf("CAMERA_ON_OFF_FUNC ");
take_picture printf("PHOTO_FUNC ");
timer_start printf("TIMER_START_FUNC ");
timer_stop printf("TIMER_STOP_FUNC ");
timer_time printf("TIMER_TIME_FUNC ");
connect printf("CONNECT_FUNC ");
disconnect printf("DISCONNECT_FUNC ");
up printf("UP_FUNC ");
forward printf("FORWARD_FUNC ");
left printf("LEFT_FUNC ");
right printf("RIGHT_FUNC ");
back printf("BACK_FUNC ");
down printf("DOWN_FUNC ");
rotate_left printf("ROTATE_LEFT_FUNC ");
rotate_right printf("ROTATE_RIGHT_FUNC ");
back_flip printf("BACK_FLIP_FUNC ");
front_flip printf("FRONT_FLIP_FUNC ");
right_flip printf("RIGHT_FLIP_FUNC ");
left_flip printf("LEFT_FLIP_FUNC ");
land printf("LAND_FUNC ");

incline printf("INCLINE_VAR " );
altitude printf("ALTITUDE_VAR ");
temperature printf("TEMPERATURE_VAR ");
acceleration printf("ACCELERATION_VAR ");
connection printf("CONNECTION_VAR ");

{identifier} printf("IDENTIFIER ");
