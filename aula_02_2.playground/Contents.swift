import UIKit

func icon() -> UIImage {
    
    guard let image = UIImage(named: "foto") else { // retorna este valor caso exista
        return UIImage(named: "default")! // retorna este valor
    }
    // Esta execucão é abortada
    return image
}

func someFunc(parameter: String?) {
    guard let parameter = parameter else {
        return
    }
    
    print(parameter)
}

someFunc(parameter: nil)

someFunc(parameter: "teste")

func getUser(name: String?) -> String {
    if let name = name  {
        return name
    }
    
    return "Default"
}

print(getUser(name: nil))

print(getUser(name: "oi"))
