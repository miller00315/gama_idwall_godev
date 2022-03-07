import UIKit
 /*
  Incrementos e operadores lógicos
  */

let num1 = 10

let num2 = 20

let compair: Bool = num1 < num2

print(compair)

let name = "Miller"

let lastName = "Aliveira"

let res = name < lastName

print(res)


/*
 >=
 <=
 !=
 ! inversão
 */


 
let isHidden: Bool = true
let isEnable: Bool = false

/*
 || ou
 
 && e
 */

let firstResult = isHidden || isEnable

print(firstResult)

let secondResult = isHidden && isEnable

print(secondResult)

/*
 incremento
 
 += incremento
 -= decremento
 
 */

var numIncrement = 10

numIncrement += 1

print(numIncrement)

numIncrement -= 1

print(numIncrement)
