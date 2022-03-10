import UIKit

protocol Nota {
    func notaAluno() -> Int
}

protocol Materia {
    func materiaAluno()
}

class Aluno {
    var name: String?
    
    var nota: Int?
    
    func getName() -> String {
        guard let name = name else {return ""}
        
        return name
    }
}

extension Aluno {
    func setAluno(name: String) {
        self.name = name
    }
}

extension Aluno {
    func resetName() {
        self.name = ""
    }
}

extension Aluno: Nota {
    func notaAluno() -> Int {
        guard let nota = nota else {return 0}
        
        return nota
    }
}

extension Aluno: Materia {
    func materiaAluno() {
        
    }
}

let fullName = "miller oliveira"

print(fullName.capitalized)

let str = "trainner ios"

print(str.prefix(1))

print(str.dropFirst())

extension String {
    func captalizingFirst() -> String {
        return self.prefix(1).capitalized + self.dropFirst()
    }
}

print(str.captalizingFirst())


extension UIColor {
    static let surfaceGrey = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}

let color: UIColor = .surfaceGrey

print(color)

extension UIImage {
    static let iconApple = UIImage(named: "appleIcon")
}

func icon() -> UIImage { //Simbolos sev
    guard let image: UIImage = .iconApple else {return UIImage(systemName: "airplane")!}

    return image
}

let image = icon()
