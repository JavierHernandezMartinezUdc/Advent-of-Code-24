input = File.read("input.txt")

reports = []
safe_reports = []

input.each_line do |report|
  reports << report.split.map(&:to_i)
end

def check_safety(report)
  for j in 0..report.length-2
    if j == 0
      ascending = report[j] < report[j+1]
    end

    diff = report[j] - report[j+1]

    if (ascending && diff >= 0) || (diff.abs > 3) || (!ascending && diff <= 0)
      return false
    end
  end

  return true
end

for i in 0..reports.length-1
  problem_dampener_result = []
  for j in 0..reports[i].length
    temp_report = reports[i].dup

    if j == reports[i].length
      problem_dampener_result << check_safety(temp_report)
    else
      temp_report.slice!(j)
      problem_dampener_result << check_safety(temp_report)
    end
  end

  if problem_dampener_result.include?(true)
    safe_reports << true
  else
    safe_reports << false
  end
end

puts safe_reports.count(true)