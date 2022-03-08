import UIKit


// Dicionário
var dic: [String: Any] = [
    "name": "Miller",
    "email":"miller@gmail.com",
    "age": 31,
    "isValid": true
]

print(dic["name"] ?? "default")

print(dic["email"]!) //! (force wrap) forca o compilador a aceitar que exxite valor

var dic1: [[String: Any]] = [[
    "name": "Miller",
    "email":"miller@gmail.com",
    "age": 31,
    "isValid": true
],[
    "name": "Miller2",
    "email":"miller2@gmail.com",
    "age": 32,
    "isValid": true
]]

print(dic1[0]["isValid"] ?? "")

dic1.remove(at: 0)

print(dic1)
