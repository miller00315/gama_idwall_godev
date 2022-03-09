import UIKit

var pilha: [String] = []

func push (_ value: String) {
    pilha.insert(value, at: 0)
}

func pop () {
    if(!pilha.isEmpty) {
        pilha.remove(at: 0)
    }
}

func showValues() {
    print(pilha)
}

push("Ola mundo")

push("novo")

push("terceiro")

showValues()

pop()

showValues()

pop()

showValues()
