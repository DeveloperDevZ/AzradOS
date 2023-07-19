/*
    *shell.l - This is a simple lexical analyzer for the azrad OS shell. 
*/
%{
#include <string.h>
#include "y.tab.h"
%}

%%
\n {
    return NEWLINE;
    }

[ \t]{
    //Discards Spaces and Tabs
    }

">"{
    return GREAT;
    }

"<"{
    return LESS;
    }

">>"{
    return GREATGREAT;
    }

">&"{
    return GREATAMPERSAND;
    }

"|"{
    return PIPE;
    }
    
"&"{
    return AMPERSAND;
    }

[^ \t\n][^ \t\n]*{
    /*Assume that the file names are ONLY alpha chars */
    yylval.string_val = strdup(yytext);
    return WORD;
    }
/*More Tokens*/
.   {
    /*Invalid character input*/
    return NOTOKEN;
}

%%