// ExprArith.g4

grammar grammarJL;

// This will be the entry point of our parser.
expr : additionExpr ;

// Addition and subtraction have the lowest precedence.
additionExpr : multiplyExpr ('+' multiplyExpr | '-' multiplyExpr)* ;

// Multiplication and division have a higher precedence.

multiplyExpr : atomExpr ('*' atomExpr | '/' atomExpr)* ;

// and or or expression
Boolexpr : Boolean | Compexpr | Boolexpr 'and' Boolexpr | Boolexpr 'or' Boolexpr ;

// 
CompExpr : atomExpr ('>' atomExpr | '<' atomexpr | '>=' atomexpr| '<=' atomexpr | '!=' atomexpr | '=' atomexpr )*;


/* An expression atom is the smallest part of an expression: a number. Or 
   when we encounter parenthesis, we're making a recursive call back to the
   rule 'additionExpr'. As you can see, an 'atomExpr' has the highest
   precedence. */

appelsexpr: (‘read’|’white’|’f’)(expr);

expr: (k|x|atomExpr|boolExpr|appelsexpr|arrayexpr);

arrayexpr: ‘new’ Array ‘of’ Type’[’expr’]’;

atomExpr : Number | '(' additionExpr ')' | '-' atomExpr ;

// A number is an integer value
Number : ('0'..'9')+ ;

Boolean : ('true'| 'false' ) ; 

Type : ('Number' | 'Boolean' | 'Array');

Array : ‘array of’ Type;

//is a constant
k:(Number | Boolean);


//is a variable
x:(‘a’..’z’)+; 

// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;
