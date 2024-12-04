input = File.read("input.txt")

matrix = []
words = 0

input.each_line do |linea|
    matrix << linea.chomp.split("")
end

def nextLetter(letter)
    case letter
    when "X" then "M"
    when "M" then "A"
    when "A" then "S"
    else "X"
    end
end

DIRECTIONS = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],          [0, 1],
    [1, -1], [1, 0], [1, 1]
]

def checkAdjacent(matrix, i, j, lastLetter, direction)
    wordCount = 0

    if lastLetter == "S"
        return 1  
    end

    if direction.nil?
        DIRECTIONS.each do |dx, dy|
            ni, nj = i + dx, j + dy
            if valid_position?(matrix, ni, nj) && matrix[ni][nj] == nextLetter(lastLetter)
                wordCount += checkAdjacent(matrix, ni, nj, nextLetter(lastLetter), [dx, dy])
            end
        end
    else
        dx, dy = direction
        ni, nj = i + dx, j + dy
        if valid_position?(matrix, ni, nj) && matrix[ni][nj] == nextLetter(lastLetter)
            wordCount += checkAdjacent(matrix, ni, nj, nextLetter(lastLetter), direction)
        end
    end

    return wordCount
end

def valid_position?(matrix, i, j)
    i >= 0 && i < matrix.length && j >= 0 && j < matrix[0].length
end

for i in 0...matrix.length
    for j in 0...matrix[i].length
        if matrix[i][j] == "X"
            words += checkAdjacent(matrix, i, j, "X", nil)
        end
    end
end

puts words
