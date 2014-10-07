f = File.new("my_stats.dat", "r")
unemployed = f.readlines
f.close
sum = 0
unemploys = []
counter = 0

unemployed.each do |unemploy|
	sum += unemploy.split(",")[1].to_f
	counter += 1
	unemploys.push(unemploy.split(",")[1].to_f)
end

avg = sum / counter
var = 0
puts "Average: #{avg.to_s}"
unemploys.each do |u|
	v = u.to_f**2
	var += v
end

variance = var / counter
sd = variance ** 0.5
puts "Standard deviation: #{sd.to_s}"

puts "What file would you like to output zscores to?"
file_zscore = gets.chomp
g = File.new(file_zscore, "w")
unemploys.each do |job|
	z = (job - avg)/sd
	g.puts("#{job}, #{z}")
end

g.close
