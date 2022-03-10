import UIKit

let nota_media = 4

switch nota_media {
case 6: // switch normal, não precisa do break
    print("Voce média")
case 5:
    print("abaixo da média")
case 10:
    print("Nota máxima")
default:
    print("Voce não informou uma nota")
}

switch nota_media {
case 0:
    print("Nota precisa estudar ")
case 1...5: // Avalia um range de valores dentro do switch
    print("Abaixo da media")
case 6...10:
    print("Voce passou")
default:
    print("Nota invalida")
}

/*
 Enumerator
 */

enum Aluno {
    case Jonas
    case Pedro
    case Maria
}

let aluno = Aluno.Jonas

switch aluno {
case .Jonas:
    print("Jonas")
case .Pedro:
    print("Pedro")
case .Maria:
    print("Maria")
}

//enum State {
//    case Success
//    case Error
//    case Loading
//}
//
//let state = State.Loading
//
//switch state {
//
//case .Success:
//    print("Sucesso")
//case .Error:
//    print("Error")
//case .Loading:
//    print("Loading")
//}

enum State: String {
    case success = "Efetuado com sucesso"
    case error = "Falha"
    case loading = "Carregando"
}

print(State.success)
print(State.success.rawValue)

let result = State.loading

switch result {
case .success:
    print(result.rawValue)
case .error:
    print(result.rawValue)
case .loading:
    print(result.rawValue)
}

enum Page: Int { // O enum identifica a sequencia
    case one = 1, two, three, four // Atribuicao implicita
    
    func getPage() -> Int { // retorna o valor do enum selecionado
        return self.rawValue // Pega o valor contido nele mesmo
    }
}

var numberPage = Page.four


print(numberPage.getPage())

enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

//Voce pode selecionar o tipo de acordo com o padrão passado
func makeDeposit(_ values: BankDeposit) {
    switch values {
        
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let isCheck):
        print("In Check: \(isCheck)")
    }
}

let deposit = BankDeposit.inValue(400)

makeDeposit(deposit)

let deposit1 = BankDeposit.inCheck(true)

makeDeposit(deposit1)


