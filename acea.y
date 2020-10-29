/* acea */
%{
#include <stdio.h>

int lineno = 1;
%}

%token BEGIN END UNDERSCORE IDENTIFIER LP RP LCB RCB SEMICOLON COMMA FINAL NUM STRING NUM_CONST STRING_CONST ASSIGNMENT_OP COMMENT LOGICAL_NOT_OP IF ELSE FOR DO WHILE RETURN INPUT_FUNC OUTPUT_FUNC CAMERA_ON_OFF_FUNC PHOTO_FUNC TIMER_START_FUNC TIMER_STOP_FUNC TIMER_TIME_FUNC CONNECT_FUNC DISCONNECT_FUNC UP_FUNC FORWARD_FUNC LEFT_FUNC RIGHT_FUNC BACK_FUNC DOWN_FUNC ROTATE_LEFT_FUNC ROTATE_RIGHT_FUNC BACK_FLIP_FUNC FRONT_FLIP_FUNC RIGHT_FLIP_FUNC LEFT_FLIP_FUNC LAND_FUNC INCLINE_VAR ALTITUDE_VAR TEMPERATURE_VAR ACCELERATION_VAR CONNECTION_VAR

%left MINUS PLUS TIMES DIVIDE MODULO EQUAL_OP NOT_EQUAL_OP GREATER_OP LESS_OP LESS_EQUAL_OP GREATER_EQUAL_OP LOGICAL_AND_OP LOGICAL_OR_OP 

%%
program : BEGIN stmts END {printf("Input program is valid.\n"); return 0;};
stmts : stmt | stmt stmts | comment stmts | comment ;
stmt : matched_if | unmatched_if ;
non_if_stmt : assn_stmt | assn_declare_stmt | do_while_stmt | for_stmt | return_stmt | while_stmt | input_stmt | output_stmt | function_stmt | empty_stmt | block_stmt | function_definition
comment : COMMENT ;
empty : ;

identifier : IDENTIFIER ;
type_name : NUM | STRING ;
type_declare : type_name | FINAL type_name ;
const : NUM_CONST | STRING_CONST ;

expression : expression logical_op logic | logic ;
logic : logic relational_op relation | relation ;
relation : relation low_op term | term ;
term : term high_op factor | factor ;
factor : LP expression RP | identifier | const | function_call | builtin_variable | LOGICAL_NOT_OP factor ;
high_op : TIMES | DIVIDE | MODULO ; 
low_op : PLUS | MINUS
relational_op : LESS_OP | GREATER_OP | EQUAL_OP | NOT_EQUAL_OP | LESS_EQUAL_OP | GREATER_EQUAL_OP ;
logical_op : LOGICAL_AND_OP | LOGICAL_OR_OP ;

function_definition : type_declare function_identifier LP function_arguments RP LCB stmts RCB ;
function_identifier : IDENTIFIER ;
function_arguments : non_empty_function_arguments | empty ;
non_empty_function_arguments : type_declare identifier | type_declare identifier COMMA non_empty_function_arguments ;
function_call_arguments : empty | non_empty_function_call_arguments ;
non_empty_function_call_arguments : expression | expression COMMA non_empty_function_call_arguments ;
user_function_call : function_identifier LP function_call_arguments RP ;
function_call : user_function_call | builtin_function ;

block_stmt : LCB stmts RCB ;
empty_stmt : SEMICOLON ;
assn_stmt : assn SEMICOLON ;
assn : identifier ASSIGNMENT_OP expression ;
assn_declare : assn | identifier ;
multiple_assn_declare : assn_declare | assn_declare COMMA  multiple_assn_declare ;
assn_declare_stmt : type_declare multiple_assn_declare SEMICOLON ;
matched_if : IF LP expression RP matched_if ELSE matched_if | non_if_stmt ;
unmatched_if : IF LP expression RP stmt | IF LP expression RP matched_if ELSE unmatched_if ;
while_stmt : WHILE LP expression RP stmt ;
do_while_stmt : DO stmt WHILE LP expression RP SEMICOLON ;
for_stmt : FOR LP init_stmt for_expression looping_stmt RP stmt ;
init_stmt : assn_declare_stmt | assn_stmt | empty_stmt ;
for_expression : expression SEMICOLON | empty_stmt ;
looping_stmt : assn | empty ;
input_stmt : UNDERSCORE UNDERSCORE INPUT_FUNC LP identifier RP SEMICOLON ;
output_stmt : UNDERSCORE UNDERSCORE OUTPUT_FUNC LP expression RP SEMICOLON ;
function_stmt : function_call SEMICOLON ;
return_stmt : RETURN SEMICOLON | RETURN expression SEMICOLON ;

builtin_variable_no_underscore : INCLINE_VAR | ALTITUDE_VAR | TEMPERATURE_VAR | ACCELERATION_VAR | CONNECTION_VAR ;
builtin_variable : UNDERSCORE UNDERSCORE builtin_variable_no_underscore ; 
builtin_function_no_underscore_no_expression : CAMERA_ON_OFF_FUNC | PHOTO_FUNC TIMER_START_FUNC | TIMER_STOP_FUNC | TIMER_TIME_FUNC | CONNECT_FUNC | DISCONNECT_FUNC | BACK_FLIP_FUNC | FRONT_FLIP_FUNC | RIGHT_FLIP_FUNC | LEFT_FLIP_FUNC | LAND_FUNC ;
builtin_function_no_underscore_with_expression : UP_FUNC | FORWARD_FUNC | LEFT_FUNC | RIGHT_FUNC | BACK_FUNC | DOWN_FUNC | ROTATE_LEFT_FUNC | ROTATE_RIGHT_FUNC ;
builtin_function : UNDERSCORE UNDERSCORE builtin_function_no_underscore_with_expression LP expression RP | UNDERSCORE UNDERSCORE builtin_function_no_underscore_no_expression LP RP ;


%%
#include "lex.yy.c"
yyerror(char *s) {fprintf(stderr, "Syntax error on line %d", lineno);}
main() {return yyparse();}
