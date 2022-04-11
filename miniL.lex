   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
%}

   /* some common rules */
DIGIT [0-9]

%%
   /* specific lexer rules in regex */
[ \t]+
"function"        {printf("FUNCTION");}
"beginparams"     {printf("BEGIN_PARAMS");}
"endparams"       {printf("END_PARAMS");}
"beginlocals"     {printf("BEGIN_LOCALS");}
"endlocals"       {printf("END_LOCALS");}
"beginbody"       {printf("BEGIN_BODY");}
"endbody"         {printf("END_BODY");}
"integer"         {printf("INTEGER");}
"array"           {printf("ARRAY");}
"enum"            {printf("ENUM");}
"of"              {printf("OF");}
"if"              {printf("IF");}
"then"            {printf("THEN");}
"endif"           {printf("ENDIF");}
"else"            {printf("ELSE");}
"for"             {printf("FOR");}
"while"           {printf("WHILE");}
"do"              {printf("DO");}
"beginloop"       {printf("BEGINLOOP");}
"endloop"         {printf("ENDLOOP");}
"continue"        {printf("CONTINUE");}
"read"            {printf("READ");}
"write"           {printf("WRITE");}
"and"             {printf("AND");}
"or"              {printf("OR");}
"not"             {printf("NOT");}
"true"            {printf("TRUE");}
"false"           {printf("FALSE");}
"return"          {printf("RETURN");}
"-"               {printf("SUB");}
"+"               {printf("ADD");}
"*"               {printf("MULT");}
"/"               {printf("DIV");}
"%"               {printf("MOD");}
"=="              {printf("EQ");}
"<>"              {printf("NEQ");}
"<"               {printf("LT");}
">"               {printf("GT");}
"<="              {printf("LTE");}
">="              {printf("GTE");}
(.{DIGIT}+)       {printf("NUMBER %s", yytext);}
";"               {printf("SEMICOLON");}
":"               {printf("COLON");}
","               {printf("COMMA");}
"("               {printf("L_PAREN");}
")"               {printf("R_PAREN");}
"["               {printf("L_SQUARE_BRACKET");}
"]"               {printf("R_SQUARE_BRACKET");}
":="              {printf("ASSIGN");}
.+                {printf("Everything else");}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}