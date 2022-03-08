import UIKit

func myCar(name: String) {
    print("meu carro é \(name)")
}

func myName(name first: String) { // alias do parametro
    print("Meu nome é \(first)")
}

myCar(name: "fusca")

myName(name: "jao")

func myAge(_ age: Int) {
    print("My age is \(age)")
}

myAge(12)

/*
 Funcao com retorno
 */

typealias FullName = String

func getName(name: String) -> FullName {
    name
}

print(getName(name: "miller"))

func getPerson(name: String, lastName: String, age: Int) -> (String, String, Int) {
    return (name, lastName, age)
}

let person = getPerson(name: "Miller", lastName: "Oliveira", age: 12)

print(person)

print(person.0, person.1, person.2)
