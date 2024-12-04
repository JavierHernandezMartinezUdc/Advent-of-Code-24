input = File.read("input.txt")

matrix = []
words = 0

input.each_line do |linea|
    matrix << linea.chomp.split("")
end

def checkAdjacent(matrix, i, j)
    if i-1 >= 0 && j-1 >= 0 && i+1 <= matrix.length-1 && j+1 <= matrix[i].length-1
      if matrix[i-1][j-1] == "M" && matrix[i-1][j+1] == "M" && matrix[i+1][j+1] == "S" && matrix[i+1][j-1] == "S"
        return 1
      end
      if matrix[i-1][j-1] == "M" && matrix[i+1][j-1] == "M" && matrix[i+1][j+1] == "S" && matrix[i-1][j+1] == "S"
        return 1
      end
      if matrix[i+1][j-1] == "M" && matrix[i+1][j+1] == "M" && matrix[i-1][j+1] == "S" && matrix[i-1][j-1] == "S"
        return 1
      end
      if matrix[i-1][j+1] == "M" && matrix[i+1][j+1] == "M" && matrix[i+1][j-1] == "S" && matrix[i-1][j-1] == "S"
        return 1
      end
    end

    return 0
end

for i in 0...matrix.length
  for j in 0...matrix[i].length
      if matrix[i][j] == "A"
          words += checkAdjacent(matrix, i, j)
      end
  end
end

puts words