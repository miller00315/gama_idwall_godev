import UIKit

/*
Colecao de dados - Array

 001000
 */

var cars = ["Fusca", "Ferrari", "Marea"]

let numbers = [1, 2, 3]

print(cars)

cars.append("Brasilia")

print(cars)

cars.insert("Kombi", at: 0)

print(cars)

cars.insert("Palio", at: 3)

print(cars)

var removed = cars.removeLast()

print(cars)

print(removed)

removed = cars.removeFirst()

print(cars)

print(removed)

removed = cars.remove(at: 1)

print(cars)

print(removed)

cars.removeAll()

print(cars)


