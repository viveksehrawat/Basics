import UIKit


var hello = {
print("Hello World")
}

hello()

let closureWithStringParameter: (String)->() = {
    name in
    print(name)
}

closureWithStringParameter("Vivek")

let closureReturningString:(String)-> String = { name in
    return name + "Vivek"
}

let result  = closureWithStringParameter("Hi")
print(result)


let multiply : (Int , Int) -> Void = {
    a,b in
    print(a,b)
}

var sumClosure : (Int, Int) -> Int = { number1 , number2 in
    return number1 + number2
}

func exampleWithClosure(firstName: String, sumCompletion: @escaping (Int, Int) -> Int) {
    sumCompletion(5, 7)
}

exampleWithClosure(firstName: "Vivek", sumCompletion: {
    number1, number2 in
    
    return sumClosure(number1,number2)
    
})

exampleWithClosure(firstName: "vivek", sumCompletion: sumClosure)
func printResult(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

printResult(print("Hello, World!"))
