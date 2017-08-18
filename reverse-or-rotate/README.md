This problem was found on [codewars](https://www.codewars.com/dashboard) and is tagged as fundamentals.

+ Input str: string of numbers

+ Input sz: number

Task:

> if input `str` is smaller than input `sz`, return empty string.

+ Intermediate Output: [chunk]

+ Intermediate Output: sum of cubes of the digits of each chunk -> sumOfCubes

+ if sumOfCubes is divisible by two, reverse

+ else, rotate to the left by 1 digits



```
sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"
```
