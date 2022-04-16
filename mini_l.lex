   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
   int curLine = 1;
   int curPos = 1;
%}

   /* some common rules */
DIGIT [0-9]
LETTER [a-zA-Z_]
EVERYTHING [a-zA-Z0-9_]
COMMENT [##].*

%%
   /* specific lexer rules in regex */
[ \t]+            {curPos += yyleng;}
{COMMENT}         {curPos = 1; curLine++;}
"\n"              {curPos = 1; curLine++;}

   /* Reserved Words*/
"function"        {printf("FUNCTION\n"); curPos += yyleng;}
"beginparams"     {printf("BEGIN_PARAMS\n"); curPos += yyleng;}
"endparams"       {printf("END_PARAMS\n"); curPos += yyleng;}
"beginlocals"     {printf("BEGIN_LOCALS\n"); curPos += yyleng;}
"endlocals"       {printf("END_LOCALS\n"); curPos += yyleng;}
"beginbody"       {printf("BEGIN_BODY\n"); curPos += yyleng;}
"endbody"         {printf("END_BODY\n"); curPos += yyleng;}
"integer"         {printf("INTEGER\n"); curPos += yyleng;}
"array"           {printf("ARRAY\n"); curPos += yyleng;}
"enum"            {printf("ENUM\n"); curPos += yyleng;}
"of"              {printf("OF\n"); curPos += yyleng;}
"if"              {printf("IF\n"); curPos += yyleng;}
"then"            {printf("THEN\n"); curPos += yyleng;}
"endif"           {printf("ENDIF\n"); curPos += yyleng;}
"else"            {printf("ELSE\n"); curPos += yyleng;}
"for"             {printf("FOR\n"); curPos += yyleng;}
"while"           {printf("WHILE\n"); curPos += yyleng;}
"do"              {printf("DO\n"); curPos += yyleng;}
"beginloop"       {printf("BEGINLOOP\n"); curPos += yyleng;}
"endloop"         {printf("ENDLOOP\n"); curPos += yyleng;}
"continue"        {printf("CONTINUE\n"); curPos += yyleng;}
"read"            {printf("READ\n"); curPos += yyleng;}
"write"           {printf("WRITE\n"); curPos += yyleng;}
"and"             {printf("AND\n"); curPos += yyleng;}
"or"              {printf("OR\n"); curPos += yyleng;}
"not"             {printf("NOT\n"); curPos += yyleng;}
"true"            {printf("TRUE\n"); curPos += yyleng;}
"false"           {printf("FALSE\n"); curPos += yyleng;}
"return"          {printf("RETURN\n"); curPos += yyleng;}
   /* Arithmetic */
"-"               {printf("SUB\n"); curPos += yyleng;}
"+"               {printf("ADD\n"); curPos += yyleng;}
"*"               {printf("MULT\n"); curPos += yyleng;}
"/"               {printf("DIV\n"); curPos += yyleng;}
"%"               {printf("MOD\n"); curPos += yyleng;}
   /* Comparison */
"=="              {printf("EQ\n"); curPos += yyleng;}
"<>"              {printf("NEQ\n"); curPos += yyleng;}
"<"               {printf("LT\n"); curPos += yyleng;}
">"               {printf("GT\n"); curPos += yyleng;}
"<="              {printf("LTE\n"); curPos += yyleng;}
">="              {printf("GTE\n"); curPos += yyleng;}
   /* Identifiers and Numbers */
[a-zA-Z]+{EVERYTHING}*[a-zA-Z0-9]     {printf("IDENT %s\n", yytext); curPos += yyleng;}
(\.{DIGIT}+)|({DIGIT}+(\.{DIGIT}*)?([eE][+-]?[0-9]+)?)        {printf("NUMBER %s\n", yytext); curPos += yyleng;}
   /* Other Symbols */ 
";"               {printf("SEMICOLON\n"); curPos += yyleng;}
":"               {printf("COLON\n"); curPos += yyleng;}
","               {printf("COMMA\n"); curPos += yyleng;}
"("               {printf("L_PAREN\n"); curPos += yyleng;}
")"               {printf("R_PAREN\n"); curPos += yyleng;}
"["               {printf("L_SQUARE_BRACKET\n"); curPos += yyleng;}
"]"               {printf("R_SQUARE_BRACKET\n"); curPos += yyleng;}
":="              {printf("ASSIGN\n"); curPos += yyleng;}
   /* Errors */
("_"|{DIGIT})+{EVERYTHING}*   {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", curLine, curPos, yytext); exit(0);}
{EVERYTHING}*"_"             {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore", curLine, curPos, yytext); exit(0);}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv){
   if(argc >= 2){
      yyin = fopen(argv[1], "r");
      if(yyin == NULL){
         yyin = stdin;
      }
   }else{
      yyin = stdin;
   }
   yylex();
}