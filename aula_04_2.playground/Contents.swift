import UIKit

struct Person {
    var name: String
    var lastName: String
    var age: Int
    
    func welcome() -> String {
        return "Welcome \(name) \(lastName) \(age)"
    }
}

var person1 = Person(name: "a", lastName: "b", age: 12)

print(person1.welcome())

var person2 = person1

person1.name = "p"

print(person1.name)
print(person2.name)
