/* 2-1
 
let addValue = { (num: Int) -> Int in
    var total = 0
    for i in (1...num) {
        total += i
    }
    return total
}

print(addValue(10))
*/

/* 2-2
let addValue = {
    var total = 0
    for i in (1...$0) {
        total += i
    }
    return total
}

print(addValue(10))
 */
