//
//  main.swift
//  2l_ChernikovOleg.playground
//
//  Created by Олег Черников on 21.02.2022.
//

import Foundation


func enterNumber() -> Int?
{
    print("Enter your number: ")

    if let input = readLine()
    {
        if let number = Int(input)
        {
            return number
        }
        else{
            print("Entered input is \(input) of the type:\(type(of: input))")
        }
    }
    return nil
}

//Написать функцию, которая определяет, четное число или нет.

func checkEven(_ number: Int) -> String
{
    if(number % 2 == 0){
        return "Number is even"
    }
    return "Number is odd"
}

//Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkIfDivided(_ number: Int, _ divider: Int) -> String
{
    if(number % divider == 0){
        return "Number is divided by \(divider)"
    }
    return "Number is not divided by \(divider)"
}

//Создать возрастающий массив из 100 чисел.

func simpleArray(_ elCount: Int, _ startNum: Int) -> Array<Int>
{
    var arSimple:[Int] = []
    for i in startNum..<elCount{
        arSimple.append(i)
    }
    return arSimple
}

//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//Подскажите, пожалуйста, какой вариант меньше ест памяти

func removeEvenAndThrees(_ usAr: Array<Int>) -> Array<Int>
{
    var newAr:[Int] = []
    for i in 0..<usAr.count{
        if (usAr[i] % 2 != 0 && usAr[i] % 3 == 0)
        {
            newAr.append(usAr[i])
        }
    }
    return newAr
}

func deleteEvenAndThrees(_ usAr: Array<Int>) -> Array<Int>
{
    return usAr.filter{$0 % 2 != 0 && $0 % 3 == 0}
}

func clearEvenAndThrees(_ usAr: Array<Int>) -> Array<Int>
{
    var newAr = usAr
    for value in newAr {
        if (value % 2) == 0 || (value % 3) != 0  {
            newAr.remove(at: newAr.firstIndex(of: value)!)
        }
    }
    return newAr
}

//Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacciNums(_ elCount: Int) -> Array<Int>
{
    var arFib:[Int] = []
    for i in 0..<elCount{
        if(i < 2){
            arFib.append(i)
        }
        else{
            arFib.append(arFib[i-1] + arFib[i-2])
        }
    }
    return arFib
}

//Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:

func simpleNumbers(_ maxNum: Int) -> Array<Int>
{
        var simpleAr: [Int] = []
        var regAr = simpleArray(maxNum, 2)
        while let firSimp = regAr.first {
            simpleAr.append(firSimp)
            regAr = regAr.filter { $0 % firSimp != 0 }
        }
        return simpleAr
}

//--------------------------

var usNumber: Int?  = enterNumber()

if let noNilNum: Int = usNumber{
    print(checkEven(noNilNum))
    print(checkIfDivided(noNilNum, 3))
}
else{
    print ("Skipping to arrays...")
}

var elCount: Int? = enterNumber()

if let noNilCount: Int = elCount{
    let usAr = simpleArray(noNilCount, 0)
    let modAr = clearEvenAndThrees(usAr)
    print(modAr)
}

print("Fibonacci")

elCount = enterNumber()

if let noNilCount: Int = elCount{
    print(fibonacciNums(noNilCount))
}

print("Simple numbers")

print(simpleNumbers(100))

print("End of program")


