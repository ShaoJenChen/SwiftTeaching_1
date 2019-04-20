


//採地雷
let dimesional = 10

var bombCount = Int.random(in: 1 ... (dimesional * dimesional)/2 )

func createZeroArray(with dimesional: Int) -> [[Int]] {
    
    let zeroArray = Array(repeating: Array(repeating: 0, count: dimesional), count: dimesional)
    
    return zeroArray
    
}

func getBombCoordinate() -> (Int,Int) {
    
    let bombColumn = Int.random(in: 0 ..< dimesional)
    
    let bombRow = Int.random(in: 0 ..< dimesional)
    
    return (bombColumn, bombRow)
    
}

func countingBombSummary(row: Int, column: Int ) -> Int {
    
    var bombCount = 0
    
    let leftTop = (row - 1, column - 1)
    let top = (row - 1, column)
    let rightTop = (row - 1, column + 1)
    
    let left = (row, column - 1)
    let right = (row, column + 1)
    
    let leftDown = (row + 1, column - 1)
    let down = (row + 1, column)
    let rightDown = (row + 1, column + 1)
    
    let eightPositions = [leftTop, top, rightTop, left, right, leftDown, down, rightDown]
    
    for (row, column) in eightPositions {
        
        if row >= 0 && row < dimesional
            && column >= 0 && column < dimesional {
            
            if minesweeperArray[row][column] == -1 {
                
                bombCount += 1
                
            }
            
        }
        
    }
    
    return bombCount
    
}

//1.產生內容全部為零的二維陣列
var minesweeperArray = createZeroArray(with: dimesional)

//2.隨機挑選地雷座標，並將地雷數值填入
while bombCount > 0 {
    
    var coordinate = getBombCoordinate()
    
    while minesweeperArray[coordinate.0][coordinate.1] == -1 {
        
        coordinate = getBombCoordinate()
    }
    
    minesweeperArray[coordinate.0][coordinate.1] = -1
    
    bombCount -= 1
    
}

//3.輪巡二維陣列
for rowIndex in 0 ..< minesweeperArray.count {
    
    for columnIndex in  0 ..< minesweeperArray[rowIndex].count {
        
        if minesweeperArray[rowIndex][columnIndex] == 0 {
            
            let sum = countingBombSummary(row: rowIndex, column: columnIndex)
            
            minesweeperArray[rowIndex][columnIndex] = sum
            
        }
        
    }
    
}

//4.印出結果陣列
print()
for rowIndex in 0..<minesweeperArray.count
{
    for columnIndex in  0..<minesweeperArray[ rowIndex ].count
    {
        let v = minesweeperArray[ rowIndex ][ columnIndex ]
        print("\(v>=0 ? " ":"")\(v) " , terminator:"")
    }
    print()
}

print()
