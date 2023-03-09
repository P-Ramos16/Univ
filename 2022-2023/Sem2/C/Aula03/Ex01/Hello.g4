grammar Hello;			//  Define a grammar called Hello
greetings : 'hello' ID ;	//  Match keyword hello followed by an identifier
bye : 'goodbye' ID ;
ID : [a-z]+ ;			//  Match lower-case identifiers
WS : [ \t\r\n]+ -> skip;	//  Skip spaces, tabs, newlines, \r (Windows)
