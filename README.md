# Implementing-Process-With-MIPS-Assembly-Language
In this project, you are required to implement some procedures in MIPS assembly language. You
will use SPIM simulator [1] to develop and test your code. There will be three questions in the
project which are unrelated.
QUESTION 1. (10 points) In this program you are required to implement a number series for
square root of 2 approximation based on given inputs. Following algorithm used to approximate
square root of 2 by the ancient mathematicians. 
 Iteration a b a2-2b2   a/b
           1 1 1 -1 1
           2 3 2 +1 1.500
           3 7 5 -1 1.400
           4 17 12 +1 1.417
           5 41 29 -1 1.414
           a2= a1+2b1
           b2=a1+b1
Your program should take a iteration count and print the list of nominator and denominator for
approximation. Next iteration a value is calculated by a+2b and next iteration b is calculated by
a+b. All the numbers in the series should fit in a word!
An example run:
Enter the number of iteration for the series: 5 
a: 1 3 7 17 41
b: 1 2 5 12 29
QUESTION 2. (22 points) In this question, you are required to implement matrix
multiplication in MIPS. Given two list of linear arrays and matrices dimensions as inputs, output
multiplication matrix will be printed. You can assume that matrix input sizes will always be valid.
For example if first matrix in length of mxn, second matrix will be in length of nxk. User will only
enter dimensions m and n where you can derive k from length of second matrix. You will
assume matrices are given in row and then column order. For example if matrix elements are:
3 5 4 6 2 8
and dimensions are 3x2, matrix is:CSE 338 – Computer Organization Spring 2020
Prof. Haluk Topcuoğlu
3 5
4 6
2 8
or if the dimensions are 2x3, matrix is:
3 5 4
6 2 8
An example run:
Enter the first matrix: 3 7 8 12 5 6 7 2 4 3 2 5
Enter the second matrix: 2 5 6 3 7 8 9 1
Enter the first dimension of first matrix: 3
Enter the second dimension of first matrix: 4
Multiplication matrix: 
212 112 
113 101 
85 50
QUESTION 3. (15 points) Write a MIPS program that performs case insensitive palindrome
checker. Given any string with the maximum length of 100 characters, you program will decide
if the given string is palindrome or not. Palindrome strings are strings that are equivalent to
their reverse. If the lower case letter is matched with the upper case letter in the reverse, it is a
valid palindrome.
Examples palindrome strings:
ABBA 
Step on no pets
abGcdEEedcgba
Example Runs:
Enter an input string: abGcdEEedcgba
abgcdeeedcgba is palindrome.
Enter an input string: ABBnMBBa
abbnmbba is not palindrome
MENU (8 points): Your program should support a Menu including all questions above. A
sample execution scenario given below:
Welcome to our MIPS project!
Main Menu:
1. Square Root Approximate
2. Matrix Multiplication
3. Palindrome
4. Exit
Please select an option: 1
 These options must be printed inside a loop until “Exit” option is selected. 
 When the user select option 1, you should print the followings:
Enter the number of iteration for the series: 5
a: 1 3 7 17 41
b: 1 2 5 12 29
Main Menu:
1. Square Root Approximate
2. Matrix Multiplication
3. Palindrome
4. Exit
Please select an option: 2
Enter the first matrix: 3 7 8 12 5 6 7 2 4 3 2 5
Enter the second matrix: 2 5 6 3 7 8 9 1
Enter the first dimension of first matrix: 3
Enter the second dimension of first matrix: 4
Multiplication matrix: 
212 112 
113 101 
85 50
Main Menu:
1. Square Root Approximate
2. Matrix Multiplication
3. Palindrome
4. Exit
Please select an option: 3
Enter an input string: abGcdEEedcgba
abgcdeeedcgba is palindrome.
Main Menu:
1. Square Root Approximate
2. Matrix Multiplication
3. Palindrome
4. Exit
Please select an option: 4
Program ends. Bye :)
