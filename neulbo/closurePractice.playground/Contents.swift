import UIKit

let addValue = { num in
    var sum = 0
    (1...num).forEach { sum += $0 }
    return sum
}

print(addValue(3))
