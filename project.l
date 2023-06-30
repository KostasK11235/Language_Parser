
%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


int yycolumn = 1;

/* #defined action that is executed before the matched rule's action */
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno; yylloc.first_column = yycolumn; yylloc.last_column = yycolumn+yyleng-1; yycolumn += yyleng;
%}

%option noyywrap
%option nodefault
%option yylineno


integer	([+|-])?[0-9]+
string	[a-zA-Z]+\.?[a-zA-Z]+
real	([+|-])?[0-9]+\.[0-9]*
%%

"{"	{ return LCURL; }
"}"	{ return RCURL; }
"["	{ return LBRACKET; }
"]"	{ return RBRACKET; }
":"	{ return COLON; }
","	{ return COMMA; }
"\""	{ return QUOTE; }
[\n]	{ yycolumn = 1; }
[ \t]	{ /* ignore whitespace */ }

"last"		{ return LAST; }
"gameId"	{ return GAMEID; }
"drawId" 	{ return DRAWID; }
"drawTime"	{ return DRAWTIME; }
"status"	{ return STATUS; }
"drawBreak"	{ return DRAWBREAK; }
"visualDraw"	{ return VISUALDRAW; }
"pricePoints"	{ return PRICEPOINTS; }
"amount"	{ return AMOUNT; }
"winningNumbers"	{ return WNNGNUMBERS; }
"list"		{ return LIST; }
"bonus"		{ return BONUS; }
"prizeCategories"	{ return PRZCATEGORIES; }
"id"		{ return ID; }
"divident"	{ return DIVIDENT; }
"winners"	{ return WINNERS; }
"distributed"	{ return DISTRIBUTED; }
"jackpot"	{ return JACKPOT; }
"fixed"		{ return FIXED; }
"categoryType"	{ return CATTYPE; }
"gameType"	{ return GAMETYPE; }
"minimumDistributed"	{ return MINDISTR; }
"wagerStatistics"	{ return WAGERSTATS; }
"columns"	{ return COLUMNS; }
"wagers" 	{ return WAGERS; }
"addOn"		{ return ADDON; }
"active"	{ return ACTIVE; }
"content"	{ return CONTENT; }
"totalPages"	{ return TOTALPAGES; }
"totalElements"	{ return TOTALELEM; }
"numberOfElements"	{ return NUMOFELEM; }
"sort"		{ return SORT; }
"direction"	{ return DIRECTION; }
"property"	{ return PROPERTY; }
"ignoreCase"	{ return IGNCASE; }
"nullHandling"	{ return NULLHANDLING; }
"descending"	{ return DESCENDING; }
"ascending"	{ return ASCENDING; }
"first"		{ return FIRST; }
"size"		{ return SIZE; }
"number"	{ return NUMBER; }
"true"		{ return TRUE; }
"false"		{ return FALSE; }

{integer}	{ yylval.integer = atoi(yytext); return INT; }
{real}		{ yylval.real = atof(yytext); return FLOAT; }
{string}	{ yylval.str = strdup(yytext); return STR; }

<<EOF>>		{ return 0; }

.	{ return UNKNOWN; }
%% 
