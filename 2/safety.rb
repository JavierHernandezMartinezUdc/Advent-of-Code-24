input = File.read("input.txt")

reports = []
safe_reports = []

input.each_line do |report|
  reports << report.split.map(&:to_i)
end

for i in 0..reports.length-1
  check_report = reports[i]
  safe_reports[i] = true
  for j in 0..check_report.length-2
    if j == 0
      ascending = check_report[j] < check_report[j+1]
    end

    diff = check_report[j] - check_report[j+1]

    if (ascending && diff >= 0) || (diff.abs > 3) || (!ascending && diff <= 0)
      safe_reports[i] = false
    end
  end
end

puts safe_reports.count(true)