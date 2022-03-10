import UIKit

var students: [String] = ["Victor", "Miller", "Fran", "Carlos"]

print(students)

print(students.last ?? "")

print(students.first ?? "")

print(students.sorted())

/*
 lhs = left hand side = Lado esquerdo
 rhs = right hand side = Lado direito
 */

//students.sort{(lhs: String, rhs: String) -> Bool in lhs > rhs} // Definindo a ordem de ordenacao

print(students)

let descending = students.sorted(by: >)

print(descending)

let name = "Olá tudo bem"

name.count

"Doug" < "Daug"

let array1 = [1,2,3,6, 9]
let array2 = [10, 23, 45, 56, 91]

let flattenArray = array1 + array2 // Une dois arrays

print(flattenArray)

/*
 Map
 */
 
let alunosNota = [4, 5, 7, 9, 3]

var novaNotas: [Int] = []

for nota in alunosNota {
    let novaNota = nota + 1
    
    novaNotas.append(novaNota)
}

print(alunosNota)

print(novaNotas)

let novaNotasMap = alunosNota.map ({ nota in
    nota + 10
})

print(novaNotasMap)

let novaNotaMapReduzido = alunosNota.map { $0 * 2 }

print(novaNotaMapReduzido)
/*
 Filter
 */

var aprovados: [Int] = []

for nota in alunosNota {
    if nota >= 6  {
        aprovados.append(nota)
    }
}

print(aprovados)

var aprovadosFilter = alunosNota.filter { nota in
    nota >= 6
}

print(aprovadosFilter)

var aprovadosFilterReduzido = alunosNota.filter{$0 >= 6}

print(aprovadosFilterReduzido)

/*
 Reduce
 */

var soma = 0

for nota in alunosNota {
    soma += nota
}

print(soma)

let notasReduce = alunosNota.reduce(0) { partialResult, value in
    partialResult + value
}

print(notasReduce)

let notasReduceReduzido = alunosNota.reduce(0, {$0 + $1})

print(notasReduceReduzido)




