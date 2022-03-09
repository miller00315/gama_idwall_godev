import UIKit

class Stack {
    private var _stack: [String] = []

    func push (_ value: String) {
        _stack.append(value)
    }

    func pop () {
        if(!_stack.isEmpty) {
            _stack.removeLast()
        }
    }

    func showValues() {
        print(_stack)
    }
}

var pilha = Stack()


pilha.push("Ola mundo")

pilha.push("novo")

pilha.push("terceiro")

pilha.showValues()

pilha.pop()

pilha.showValues()

pilha.pop()

pilha.showValues()
