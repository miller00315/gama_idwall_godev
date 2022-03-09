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

var stack = Stack()


stack.push("Ola mundo")

stack.push("novo")

stack.push("terceiro")

stack.showValues()

stack.pop()

stack.showValues()

stack.pop()

stack.showValues()
