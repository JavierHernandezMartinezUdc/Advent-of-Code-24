input = File.read("input.txt")

lista1 = []
lista2 = []
diff = 0

input.each_line do |linea|
    valores = linea.split
    lista1 << valores[0].to_i
    lista2 << valores[1].to_i
end

lista1.sort!
lista2.sort!

for i in 0..lista1.length-1
    diff += (lista1[i] - lista2[i]).abs
end

puts diff