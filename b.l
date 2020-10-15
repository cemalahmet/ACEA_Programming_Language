%option main
%% 
digit [0-9]
sign [+-]
letter [_a-zA-Z]
const {sign}?{digit}*(\.)?{digit}+
identifier {digit}+{letter}|
string [a-zA-Z0-9_]+
comment /*{string}*/
%%

\( printf("LP ");
\) printf("RP ");
\{ printf("LCB ");
\} printf("RCB ");

{identifier} printf("IDENTIFIER ");
{const} printf("CONST ");

\= printf("ASSIGNMENT_OP ");
\- printf("MINUS ");
\+ printf("PLUS ");
\* printf("TIMES ");
** printf("POWER ");
\% printf("MODULO ");
>> printf("SRL ");
<< printf("SLL ");
>>> printf("SRA ");
<<< printf("SLA ");

{comment} printf("COMMENT ");

== printf("EQUAL_OP ");
!= printf("NOT_EQUAL_OP ");
>  printf("GREATER_OP");
<  printf("LESS_OP");
<= printf("LESS_EQUAL_OP ");
>= printf("GREATER_EQUAL_OP");
printf("");

if printf("IF ");
for printf("FOR ");
do printf("DO ");
while printf("WHILE ");

__scan printf("INPUT_FUNC ");
__print printf("OUTPUT_FUNC ");
__switch_camera printf("CAMERA_ON_OFF_FUNC ");
__take_picture printf("PHOTO_FUNC ");
__timer_start printf("TIMER_START_FUNC ")
__timer_stop printf("TIMER_STOP_FUNC ");
__timer_time printf("TIMER_TIME_FUNC");
__connect printf("CONNECT_FUNC ");
__disconnect printf("DISCONNECT_FUNC ");

__incline printf("INCLINE_VAR " );
__altitude printf("ALTITUDE_VAR ");
__temperature printf("TEMPERATURE_VAR ");
__acceleration printf("ACCELERATION_VAR ");
__connection printf("CONNECTION_VAR ");


