/* acea.l */

digit [0-9]
sign [+-]
letter [a-zA-Z\_]
num {sign}?{digit}*(\.)?{digit}+
identifier {letter}({letter}|{digit})*
comment_start \/\* 
comment_end   \*\/
string \".*\"

%%

\n {extern int lineno; lineno++;}
([ ])+ {/* ignore new lines, spaces and tabs */}
\t+ ;

begin {return BEGIN_PROGRAM;}
end   {return END_PROGRAM;}

\_ {return UNDERSCORE;}
\( {return LP;}
\) {return RP;}
\{ {return LCB;}
\} {return RCB;}
\; {return SEMICOLON;}
\, {return COMMA;}

final {return FINAL;}
num {return NUM;}
string {return STRING;}

{num} {return NUM_CONST;}
{string} {return STRING_CONST;}

\= {return ASSIGNMENT_OP;}
\- {return MINUS;}
\+ {return PLUS;}
\* {return TIMES;} 
\/ {return DIVIDE;}
\% {return MODULO;}

{comment_start}.*{comment_end} {return COMMENT;}

\=\= {return EQUAL_OP;}
\!\= {return NOT_EQUAL_OP;}
\>  {return GREATER_OP;}
\<  {return LESS_OP;}
\<\= {return LESS_EQUAL_OP;}
\>\= {return GREATER_EQUAL_OP;}

\&\& {return LOGICAL_AND_OP;}
\|\| {return LOGICAL_OR_OP;}
\! {return LOGICAL_NOT_OP;}

if {return IF;}
else {return ELSE;}
for {return FOR;}
do {return DO;}
while {return WHILE;}
return {return RETURN;}

\_\_scan {return INPUT_FUNC;}
\_\_print {return OUTPUT_FUNC;}
\_\_switch_camera {return CAMERA_ON_OFF_FUNC;}
\_\_take_picture {return PHOTO_FUNC;}
\_\_timer_start {return TIMER_START_FUNC;}
\_\_timer_stop {return TIMER_STOP_FUNC;}
\_\_timer_time {return TIMER_TIME_FUNC;}
\_\_connect {return CONNECT_FUNC;}
\_\_disconnect {return DISCONNECT_FUNC;}
\_\_up {return UP_FUNC;}
\_\_forward {return FORWARD_FUNC;}
\_\_left {return LEFT_FUNC;}
\_\_right {return RIGHT_FUNC;}
\_\_back {return BACK_FUNC;}
\_\_down {return DOWN_FUNC;}
\_\_rotate_left {return ROTATE_LEFT_FUNC;}
\_\_rotate_right {return ROTATE_RIGHT_FUNC;}
\_\_back_flip {return BACK_FLIP_FUNC;}
\_\_front_flip {return FRONT_FLIP_FUNC;}
\_\_right_flip {return RIGHT_FLIP_FUNC;}
\_\_left_flip {return LEFT_FLIP_FUNC;}
\_\_land {return LAND_FUNC;}

\_\_incline {return INCLINE_VAR;}
\_\_altitude {return ALTITUDE_VAR;}
\_\_temperature {return TEMPERATURE_VAR;}
\_\_acceleration {return ACCELERATION_VAR;}
\_\_connection {return CONNECTION_VAR;}

{identifier} {return IDENTIFIER;}

%%
int yywrap() {return 1;}
