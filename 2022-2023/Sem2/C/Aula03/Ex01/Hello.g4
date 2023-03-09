grammar Hello;			//  Define a grammar called Hello

command : greetings | bye;	//  Choose which rule to use

//  Remover '+' e 'A-Z'

greetings : 'hello' ID+ ;	//  Match keyword hello followed by an identifier
bye : 'bye' ID+ ;		//  Match keyword bye followed by an identifier

ID : [a-zA-Z]+ ;			//  Match lower-case identifiers
WS : [ \t\r\n]+ -> skip;	//  Skip spaces, tabs, newlines, \r (Windows)
