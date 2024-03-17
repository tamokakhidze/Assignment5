import Foundation



//1.დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)

func isPalindrome(word: String) -> Bool {
    var invertedWord = ""
    var len = word.count
    for i in stride(from: len - 1, to: -1, by: -1) {
        invertedWord.append(word[word.index(word.startIndex, offsetBy: i)])
    }
    
    if word == invertedWord {
        return true
    }
    else {
        return false
    }
    
}

print(isPalindrome(word: "აირევი ივერია"))

//2.დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func creatingSquareOfArrayElements (array: [Int]) -> [Int] {
    var squaredArray = [Int]()
    for i in 0...array.count - 1 {
        squaredArray.append(array[i] * array[i])
    }
    
    return squaredArray
    
}

print(creatingSquareOfArrayElements(array: [5, 4]))

//3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.

let filterEvenNumbers: (_ a: inout [Int]) -> [Int] = { array in
    var withoutEvens = [Int]()
    for i in array {
        if i % 2 == 1 {
            withoutEvens.append(i)
        }
        
    }
    return withoutEvens
}

var arrayToFilter = [2, 3, 4, 8, 9]
print(filterEvenNumbers(&arrayToFilter))


//4.დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.


let sum = { (array: [Int]) -> Int in
    
    var total = 0
    for num in array {
        total += num
    }
    
    return total
}

func sumOfArraysElements(array: [Int], closure: @escaping (Int) -> Void
) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        
       print("ამ მასივის ელემენტების ჯამია: ",sum(array))
        
    }
    
    print("📍", array)
}

sumOfArraysElements(array: [2, 3, 4]) {total in}




//5.შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var contacts = [
    "Nia": 555,
    "Nino": 666
]

contacts["Khatia"] = 444
contacts.removeValue(forKey: "Nia")
print(contacts["Nino"]!)
print(contacts)


//6.დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

func alphabeticallySortedKeys(dict: [String: Int]) -> [String] {
    var arrayOfkeys = [String]()
    
    for key in dict.keys {
        arrayOfkeys.append(key)
    }
    
    return arrayOfkeys.sorted()
}

print(alphabeticallySortedKeys(dict: [
    "D": 5,
    "H": 6,
    "A": 8
]))

//7.შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

var arrayOfDoubles: [Double] = [10.3, 4,5, 8.9, 0.1]
var max = arrayOfDoubles[0]

for i in arrayOfDoubles {
    
    if i > max {
        max = i
    }
}

print(max)

// ----------------
//Optional:

//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:

let lelaWhatMovementIsThis: [String: Int] = [

    "ღამის სიჩუმე გაფანტე": 235,

    "ვიხსენებ ყველაფერს თავიდან": 219,

    "სულელი წვიმა": 231,

    "ალალ მე": 231,

    "იდუმალი ღამე": 221,

    "ჩუმად ნათქვამი": 199,

    "თეთრი ქარავანი": 221,

    "ძველი ვერხვები": 193

]

//დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
func durationOfSong(dict: [String: Int]) -> (minutes: Int, seconds: Int){
    var totalDuration = 0
    
    for values in lelaWhatMovementIsThis.values {
        totalDuration += values
    }
    
    let minutes = totalDuration
    let seconds = totalDuration * 60
    
    return (minutes, seconds)
    
}

print(durationOfSong(dict:  lelaWhatMovementIsThis))



//დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.


func longestAndShortestSong(dict: [String: Int]) -> (longest: Int, shortest: Int){
    var arrayOfValues = [Int]()
    
    for value in dict.values {
        arrayOfValues.append(value)
    }
    
    var longest = arrayOfValues[0]
        var shortest = arrayOfValues[0]
    
    for i in arrayOfValues {
        if i > longest {
            longest = i
        }
        if i < shortest {
            shortest = i
        }
    }
    
    return (longest, shortest)
    
}

print(longestAndShortestSong(dict: lelaWhatMovementIsThis))


//დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას

func averageDurationOfSongs(dict: [String: Int]) -> Int {
    var sum = 0
    var numberOfSongs = 0
    
    for values in dict.values {
        sum += values
        numberOfSongs += 1
    }
    
    return sum / numberOfSongs
}

print(averageDurationOfSongs(dict: lelaWhatMovementIsThis))

//დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს

func randomSong(dict: [String: Int]) -> String {
    
    var songs = [String]()
    
    for key in dict.keys {
        songs.append(key)
    }
    
    return songs.randomElement() ?? ""
}

print(randomSong(dict: lelaWhatMovementIsThis))



