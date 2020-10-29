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

\n {extern int lineno; lineno++}

begin return BEGIN;
end   return END;

\_ return UNDERSCORE;
\( return LP;
\) return RP;
\{ return LCB;
\} return RCB;
\; return SEMICOLON;
\, return COMMA;

final return FINAL;
num return NUM;
string return STRING;

{num} return NUM_CONST;
{string} return STRING_CONST;

\= return ASSIGNMENT_OP;
\- return MINUS;
\+ return PLUS;
\* return TIMES; 
\/ return DIVIDE
\% return MODULO;

{comment_start}.*{comment_end} return COMMENT;

\=\= return EQUAL_OP;
\!\= return NOT_EQUAL_OP;
\>  return GREATER_OP;
\<  return LESS_OP;
\<\= return LESS_EQUAL_OP;
\>\= return GREATER_EQUAL_OP;

\&\& return LOGICAL_AND_OP;
\|\| return LOGICAL_OR_OP;
\! return LOGICAL_NOT_OP;

if return IF;
else return ELSE;
for return FOR;
do return DO;
while return WHILE;
return return RETURN;

scan return INPUT_FUNC;
print return OUTPUT_FUNC;
switch_camera return CAMERA_ON_OFF_FUNC;
take_picture return PHOTO_FUNC;
timer_start return TIMER_START_FUNC;
timer_stop return TIMER_STOP_FUNC;
timer_time return TIMER_TIME_FUNC;
connect return CONNECT_FUNC;
disconnect return DISCONNECT_FUNC;
up return UP_FUNC;
forward return FORWARD_FUNC;
left return LEFT_FUNC;
right return RIGHT_FUNC;
back return BACK_FUNC;
down return DOWN_FUNC;
rotate_left return ROTATE_LEFT_FUNC;
rotate_right return ROTATE_RIGHT_FUNC;
back_flip return BACK_FLIP_FUNC;
front_flip return FRONT_FLIP_FUNC;
right_flip return RIGHT_FLIP_FUNC;
left_flip return LEFT_FLIP_FUNC;
land return LAND_FUNC;

incline return INCLINE_VAR;
altitude return ALTITUDE_VAR;
temperature return TEMPERATURE_VAR;
acceleration return ACCELERATION_VAR;
connection return CONNECTION_VAR;

{identifier} return IDENTIFIER;

%%
int yywrap() {return 1;}

