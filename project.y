%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>

void yyerror(char *);

extern FILE *yyin;
extern FILE *yyout;
extern int yylex();
extern int yyparse();
extern char* yytext;
extern int yylineno;
extern int yycolumn;

/*prizeCategories number of objects */
int jsonObj_counter = 0;

/* list numbers counter */
int list_counter = 0;

/* general error counter */
int error_counter = 0;
%}

%locations 

%union
{
	char *str;
	int integer;
	float real;
}

%token LCURL RCURL LBRACKET RBRACKET COLON COMMA QUOTE UNKNOWN
%token <str> LAST GAMEID DRAWID DRAWTIME STATUS DRAWBREAK VISUALDRAW PRICEPOINTS AMOUNT WNNGNUMBERS LIST BONUS PRZCATEGORIES ID DIVIDENT WINNERS DISTRIBUTED JACKPOT FIXED CATTYPE GAMETYPE MINDISTR WAGERSTATS COLUMNS WAGERS ADDON ACTIVE CONTENT TOTALPAGES TOTALELEM NUMOFELEM SORT DIRECTION PROPERTY IGNCASE NULLHANDLING DESCENDING ASCENDING FIRST SIZE NUMBER TRUE FALSE 
%token <str> STR
%token <integer> INT
%token <real> FLOAT

%%

program: LCURL last active RCURL 	{ return 0; }
       | LCURL content totalPages totalElements last numberOfElements sort first size number RCURL { return 0; }
       ;

last: QUOTE LAST QUOTE COLON LACobj
    ;

content: QUOTE CONTENT QUOTE COLON LBRACKET LACobj RBRACKET COMMA
       ;

LACobj: 
     | COMMA LACobj
     | LCURL gameId drawId drawTime status drawBreak visualDraw pricePoints winningNumbers prizeCategories wagerStatistics RCURL LACobj
    ;

gameId: error COMMA
      | QUOTE GAMEID QUOTE COLON INT COMMA	{ if($5!=1100 && $5!=1110 && $5!=2100 && $5!=2101 && $5!=2101 && $5!=5103 && $5!=5104 && $5!=5106){printf("\nError: invalid gameId.\n"); error_counter++; return 0; }}
      ;

drawId: error COMMA
      | QUOTE DRAWID QUOTE COLON INT COMMA
      ;

drawTime: error COMMA
	| QUOTE DRAWTIME QUOTE COLON INT COMMA
	;

status: error COMMA
      | QUOTE STATUS QUOTE COLON QUOTE ACTIVE QUOTE COMMA
      | QUOTE STATUS QUOTE COLON QUOTE STR QUOTE COMMA
      ;

drawBreak: error COMMA
	 | QUOTE DRAWBREAK QUOTE COLON INT COMMA
	 ;

visualDraw: error COMMA
	  | QUOTE VISUALDRAW QUOTE COLON INT COMMA
	  ;

pricePoints: error COMMA
	   | QUOTE PRICEPOINTS QUOTE COLON LCURL amount RCURL COMMA
	   ;

amount: error RCURL
      | QUOTE AMOUNT QUOTE COLON FLOAT
      ;

winningNumbers: error COMMA
	      | QUOTE WNNGNUMBERS QUOTE COLON LCURL list bonus RCURL COMMA
	      ;

list: error COMMA
    | QUOTE LIST QUOTE COLON LBRACKET array RBRACKET COMMA	{ if(list_counter>5){ printf("\nError: list has more than 5 numbers, line:%d - col:%d.\n",yylineno,yycolumn); error_counter++; return 0; }else if(list_counter<5){ printf("\nError: list has less than 5 numbers, line:%d - col:%d.\n",yylineno,yycolumn); error_counter++; return 0;}else{list_counter=0;} }
    ;

array:
     | error COMMA
     | COMMA array
     | INT array	{ list_counter++; if($1<1 || $1>45){ printf("Error: invalid number in list.\n"); error_counter++; return 0;} }
     ;

bonus: error COMMA
     | QUOTE BONUS QUOTE COLON LBRACKET INT RBRACKET
     ;

prizeCategories: error COMMA
	       | QUOTE PRZCATEGORIES QUOTE COLON LBRACKET jsonObj RBRACKET COMMA { if(jsonObj_counter>8){printf("\nError: more than 8 json Objects in prizeCategories.\n"); error_counter++; return 0;}else if(jsonObj_counter<8){printf("\nError: less than 8 json Objects in prizeCategories.\n"); error_counter++; return 0;}else{jsonObj_counter=0;} }
	       ;

jsonObj:
       | error COMMA jsonObj
       | error RCURL jsonObj
       | COMMA jsonObj
       | LCURL id divident winners distributed jackpot fixed catType gameType minDistributed RCURL jsonObj { jsonObj_counter++; }
       ;

id: error COMMA
  | QUOTE ID QUOTE COLON INT COMMA
  ;

divident: error COMMA
	| QUOTE DIVIDENT QUOTE COLON FLOAT COMMA
	;

winners: error COMMA
       | QUOTE WINNERS QUOTE COLON INT COMMA
       ;

distributed: error COMMA
	   | QUOTE DISTRIBUTED QUOTE COLON FLOAT COMMA
	   ;

jackpot: error COMMA
       | QUOTE JACKPOT QUOTE COLON FLOAT COMMA
       ;

fixed: error COMMA
     | QUOTE FIXED QUOTE COLON FLOAT COMMA
     ;

catType: error COMMA
       | QUOTE CATTYPE QUOTE COLON INT COMMA
       ;

gameType: error COMMA
	| QUOTE GAMETYPE QUOTE COLON QUOTE STR QUOTE
	;

minDistributed: 
	      | error RCURL
	      | COMMA QUOTE MINDISTR QUOTE COLON FLOAT
	      ;

wagerStatistics: error RCURL
	       | QUOTE WAGERSTATS QUOTE COLON LCURL columns wagers addOn RCURL
	       ;

columns: error COMMA
       | QUOTE COLUMNS QUOTE COLON INT COMMA
       ;

wagers: error COMMA
      | QUOTE WAGERS QUOTE COLON INT COMMA
      ;

addOn: error RCURL
     | QUOTE ADDON QUOTE COLON LBRACKET RBRACKET
     ;

active: QUOTE ACTIVE QUOTE COLON LCURL gameId drawId drawTime status drawBreak visualDraw pricePoints prizeCategories wagerStatistics RCURL
      ;

totalPages: error COMMA 
	  | QUOTE TOTALPAGES QUOTE COLON INT COMMA
	  ;

totalElements: error COMMA
	     | QUOTE TOTALELEM QUOTE COLON INT COMMA
	     ;

last: error COMMA
    | QUOTE LAST QUOTE COLON boole COMMA
    ;

boole: TRUE
     | FALSE
     ;

numberOfElements: error COMMA
		| QUOTE NUMOFELEM QUOTE COLON INT COMMA
                ;

sort: error COMMA
    | QUOTE SORT QUOTE COLON LBRACKET sortObj RBRACKET COMMA
    ;

sortObj: error RCURL
       | error COMMA
       | LCURL direction property ignoreCase nullHandling descending ascending RCURL
       ;

direction: error COMMA
	 | QUOTE DIRECTION QUOTE COLON QUOTE STR QUOTE COMMA
	 ;

property: error COMMA
	| QUOTE PROPERTY QUOTE COLON QUOTE STR QUOTE COMMA
	;

ignoreCase: error COMMA
	  | QUOTE IGNCASE QUOTE COLON boole COMMA
	  ;

nullHandling: error COMMA
	    | QUOTE NULLHANDLING QUOTE COLON QUOTE STR QUOTE COMMA
	    ;

descending: error COMMA
	  | QUOTE DESCENDING QUOTE COLON boole COMMA
	  ;

ascending: error COMMA
	 | QUOTE ASCENDING QUOTE COLON boole
	 ;

first: error COMMA
     | QUOTE FIRST QUOTE COLON boole COMMA
     ;

size: error COMMA
    | QUOTE SIZE QUOTE COLON INT COMMA
    ;

number: error COMMA
      | QUOTE NUMBER QUOTE COLON INT
      ;

%%

void yyerror(char *s)
{
	printf("Syntax error in line: %d - column: %d\n",yylineno,yycolumn);
	error_counter++;
}

int main(int argc,char **argv)
{
	/*	
	#ifdef YYDEBUG
	extern int yydebug;
	yydebug = 1;
	#endif
	*/

	char c;

	//open a file handler
	FILE *fptr = fopen(argv[1],"r");
	
	if(!fptr)
	{
		printf("Error opening file.\n");
		return -1;
	}

	//set flex to read from it instead of defaulting to stdin
	yyin = fptr;
	
	yyparse();

	fclose(fptr);
	
	/* Check for errors and print the appropriate message */
	if(error_counter==0)
	{
		printf("\n-----------------------------------------------\n");
		printf("#Errors: %d\nNo errors found in the input file.",error_counter);
		printf("\n-----------------------------------------------\n\n\n");
	}
	else
	{
		printf("\n-----------------------------------------------\n");
		printf("#Errors: %d\nSyntax is incorrect!",error_counter);
		printf("\n-----------------------------------------------\n\n\n");
	}

	/* Read the input file and print it */	
	FILE *read = fopen(argv[1],"r");

	c = fgetc(read);
	while(c!=EOF)
	{
		printf("%c",c);
		c = fgetc(read);
	}
	
	fclose(read);
	
	return 0;
}
