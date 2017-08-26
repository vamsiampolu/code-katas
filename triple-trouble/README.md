This problem was picked up from [codewars](https://www.codewars.com/dashboard). The problem statement is provided below:

Write a function called `tripledouble(num1, num2)` which accepts two numbers. It has to:

1. return `1` if the first number has a `straight triple` for a given digit and number2 has a `straight` double for the same given number.

2. return 0 in all other cases.

Examples:

```
num1 = 451999277 // num1 has a 999
num2 = 41177722899 // num2 has a 99
tripledouble(num1, num2) // result is 1

num1 = 1222345 // num1 has a 222
num2 = 12345 // num2 has no 22
tripledouble(num1, num2) // result is 0

num1 = 12345 // no triples found <- can return 0 after this
num2 = 12345 // no doubles found

tripledouble(num1, num2)

num1 = 666789 // num1 has 666
num2 = 12345667 // num2 has a 66

tripledouble(num1, num2) // result is 1
```
