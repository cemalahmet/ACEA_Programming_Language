%option main
digit [0-9]
sign [+-]
letter [\_a-zA-Z]
const {sign}?{digit}*(\.)?{digit}+
identifier {letter}({letter}|{digit})+
string [a-zA-Z0-9\_]+
comment \/\*{string}\*\/
%%

\( printf("LP ");
\) printf("RP ");
\{ printf("LCB ");
\} printf("RCB ");


{const} printf("CONST ");

\= printf("ASSIGNMENT_OP ");
\- printf("MINUS ");
\+ printf("PLUS ");
\* printf("TIMES ");


{comment} printf("COMMENT ");

\=\= printf("EQUAL_OP ");
\!\= printf("NOT_EQUAL_OP ");
\>  printf("GREATER_OP");
\<  printf("LESS_OP");
\<\= printf("LESS_EQUAL_OP ");
\>\= printf("GREATER_EQUAL_OP");

if printf("IF ");
for printf("FOR ");
do printf("DO ");
while printf("WHILE ");

\_\_scan printf("INPUT_FUNC ");
\_\_print printf("OUTPUT_FUNC ");
\_\_switch_camera printf("CAMERA_ON_OFF_FUNC ");
\_\_take_picture printf("PHOTO_FUNC ");
\_\_timer_start printf("TIMER_START_FUNC ");
\_\_timer_stop printf("TIMER_STOP_FUNC ");
\_\_timer_time printf("TIMER_TIME_FUNC");
\_\_connect printf("CONNECT_FUNC ");
\_\_disconnect printf("DISCONNECT_FUNC ");

\_\_incline printf("INCLINE_VAR " );
\_\_altitude printf("ALTITUDE_VAR ");
\_\_temperature printf("TEMPERATURE_VAR ");
\_\_acceleration printf("ACCELERATION_VAR ");
\_\_connection printf("CONNECTION_VAR ");

{identifier} printf("IDENTIFIER ");

