import UIKit

func palindromo(_ text: String) -> Bool {
    if text.isEmpty {
        return true
    }
    
    return text == String(text.reversed())
}

print(palindromo("oppo"))
