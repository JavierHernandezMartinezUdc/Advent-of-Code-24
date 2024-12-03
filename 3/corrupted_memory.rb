input = File.read('input.txt')

total = 0

operations = input.scan(/mul\([^,(]+,[^,)]+\)/)

operations.each do |operation|
  operation.gsub!('mul(', '')
  operation.gsub!(')', '')
  args = operation.split(',')

  if args[0].match?(/\A\d+\z/) && args[1].match?(/\A\d+\z/)
    total += args[0].to_i * args[1].to_i
  end
end

puts total