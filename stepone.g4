// essai.g4

grammar essai;

// This will be the entry point of our parser.
expr : (c|atomExpr|boolExpr|additionExpr | multiplyExpr | Type );

// Addition and subtraction have the lowest precedence.
additionExpr : multiplyExpr ('+' multiplyExpr | '-' multiplyExpr)* ;

// Multiplication and division have a higher precedence.
multiplyExpr : atomExpr ('*' atomExpr | '/' atomExpr)* ;

// Boolean comparaison
binOpComp : atomExpr ('>' atomExpr | '>=' atomExpr | '<' atomExpr | '<=' atomExpr | '=' atomExpr | '!=' atomExpr) * ;

// Simple expression with boolean
boolExpr : Boolean | binOpComp | binOpAndOr | 'not' boolExpr ;

//expression AND or OR
binOpAndOr : binOpComp ('and' binOpComp | 'or' binOpComp ) * ;



/* An expression atom is the smallest part of an expression: a number. Or 
   when we encounter parenthesis, we're making a recursive call back to the
   rule 'additionExpr'. As you can see, an 'atomExpr' has the highest
   precedence. */
atomExpr : Number | '(' additionExpr ')' | '-' atomExpr ;

// A number is an integer value
Number : ('0'..'9')+ ;

// We're going to ignore all white space characters
WS : [ \t\r\n]+ -> skip ;

Type : ('Number' | 'Boolean' | 'Array');

Boolean : ('true'| 'false' ) ; 

//Array of Type
Array : 'array' 'of' Type; 

//c is a constant
c : (Number | Boolean);

