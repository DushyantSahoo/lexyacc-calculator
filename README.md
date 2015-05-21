# lexyacc-calculator

This Interpreter includes 2 files to run a flex file and a yacc file.

1. Open the terminal and go to the folder where these files are
2. Write the the command lex bc.l to compile the lex file
3. Then write yacc term1.y to compile the yacc file , this will generate y.tab.c
4. Then compile y.tab.c using c compiler to generate a.out by writing the command cc y.tab.c -ly -ll -lm
5. Run the a.out file using ./a.out command 
6. Your calculator is ready 
7. You can use different functions/operators given in manual
8. If u write something other than functions as specified in manual it will give syntax error
9. In order to get out of the calculator type ctrl+C .

Scientific calculator using lex and yacc
Functions and Instructions :-

1. log()    :- Logarithmic function used for calculating log value 
2. pi        :- Writing pi will give out the value of pi
3. sin()    :- Sin function used for calculating sin value
4. cos()   :- Cos function used for calculating cos value     
5. tan()    :- Tan function used for calculating tan value     
6. and      :- It will give logical AND of 2 numbers 
7. sinh()   :- Sinh function used for return the sin hypotenuse  value
8. cosh()  :- Cosh function used for returning the cos hypotenuse value   
9. tanh()   :- Tanh function used for returning the tan hypotenuse value 
10. &        :- It used to return bitwise AND of 2 numbers  
11. xor      :- It is used to return XOR of 2 numbers   
12. or        :- It is used to return OR of 2 numbers 
13. ceil      :- It gives nearest integer greater then or equal to the number 
14. floor    :- It gives nearest integer smaller then or equal to the number
15. abs()   :- Returns the absolute value of the number 
16. "<<"    :- Left shifts the bits of expression to left of operator by number                     		specified to the right of operator 
17. ">>"    :- Right shifts the bits of expression to left of operator by number                     		specified to the right of operator 
18. "++"    :- Increment the number by 1 by writing ++ after number
19. "--"      :- Decrement the number by 1 by writing – after number
20. "+"      :- Used for adding 2 numbers 
21. "-"       :- it is used for subtracting 2 numbers  
22. "|"       :- It gives bitwise OR of 2 numbers;
23. "%"     :- It return the quotient when dividing 2 numbers
24. "*"      :- it used for multiplying 2 numbers 
25. "^"      :- Returns the number given by left number to the operator to the power of number to the                 	right of operator
26. sqrt()  :- It will return the square root value  
27. "/"       :- It return the approximate number when 2 numbers are divided  
28. "&&"  :- Returns logical AND of 2 numbers 
29. “||”      :- Gives logical OR of 2 numbers
30. asin()    :- asin function used for calculating inverse sin value
31. acos()   :- acos function used for calculating inverse cos value     
32. atan()    :- atan function used for calculating inverse tan value   
34. factorial() :- It will calculate the factorial of the given number
35. bin_dec() :- Give a number in 1s and 0s and the function will return the decimal value

All the values in trigonometric functions which are inserted or returned are in radians . 
If the user wants to calculate other than this and if it gives input in the manner other than above specified it will give syntax error . In case of input given is out of range in inverse functions it will print out “nan” i.e. it is out of range .
In case of bin_dec function if u give integer other than 0 and 1 it will return the same value.



