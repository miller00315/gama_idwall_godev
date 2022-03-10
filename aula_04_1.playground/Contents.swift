import UIKit

class Person {
    var name: String
    private var lastName: String
    private var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }

    func welcome() -> String {
        return "Welcome \(name) \(lastName) \(age)"
    }
    
    func getName() -> String {
        return name
    }
}

var person1 = Person(name: "a", lastName: "b", age: 32)

person1.getName()

print(person1.welcome())

var person2 = person1

person1.name = "v"

print(person1.name)
print(person2.name)

class Animal {
    func comer() {
        print("Fez nada")
    }
}

class Dog: Animal {
    override func comer() {
        print("Comeu")
    }
}
