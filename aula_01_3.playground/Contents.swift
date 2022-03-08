import UIKit
 
var isHided: Bool = false

if isHided {
    print("Hided")
} else {
    print("Not hided")
}

var system: String
let company: String = "Apple"

if company == "Apple" {
    system = "IOS"
} else {
    system = "Android"
}

print(system)

system = company == "Apple" ? "IOS" : "Android"
