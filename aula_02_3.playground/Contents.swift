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

/*
 Clousure
 */

func makeBuy(value: Int, onCompletion: (Int) -> Void) {
    onCompletion(value)
}

makeBuy(value: 50) {res in print("res: \(res)")}

typealias OnCompletion = (String) -> Void // Type alias para uma funcao
typealias OnCompletionError = (String) -> Void // Type alias para uma funcao


func makeBuy(success: Bool, onCompletion: OnCompletion, onCompletionError: OnCompletionError) {
    if(success) {
        onCompletion("success")
    } else {
        onCompletionError("Error")
    }
}

makeBuy(success: true) {success in
    print(success)
} onCompletionError: {error in
    print(error)
}





