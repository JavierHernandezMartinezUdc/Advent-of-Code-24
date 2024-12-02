input = File.read("input.txt")

lista1 = []
lista2 = []
similarity = 0

input.each_line do |linea|
  valores = linea.split
  lista1 << valores[0].to_i
  lista2 << valores[1].to_i
end

for i in 0..lista1.length-1
  times = 0
  for j in 0..lista2.length-1
    if lista1[i] == lista2[j]
      times += 1
    end  
  end
  similarity += lista1[i] * times
end

puts similarity