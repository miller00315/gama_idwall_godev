import UIKit

func palindromo(_ text: String) -> Bool {
    if text.isEmpty {
        return true
    }
    
    let newText = text.filter { char in
        char != " "
    }
    
    return newText == String(newText.reversed())
}

print(palindromo("oppo"))

print(palindromo("miller"))

print(palindromo("a a b"))

print(palindromo("a a a"))
