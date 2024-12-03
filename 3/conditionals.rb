input = File.read('input.txt')

total = 0
enabled = true

operations = input.scan(/mul\([^,(]+,[^,)]+\)|do\(\)|don't\(\)/)

operations.each do |operation|
  if operation == "do()"
    enabled = true
  elsif operation == "don't()"
    enabled = false
  else
    operation.gsub!('mul(', '')
    operation.gsub!(')', '')
    args = operation.split(',')
  
    if args[0].match?(/\A\d+\z/) && args[1].match?(/\A\d+\z/) && enabled
      total += args[0].to_i * args[1].to_i
    end
  end
end

puts total