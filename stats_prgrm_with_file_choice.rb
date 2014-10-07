puts "What is the name of the file?"
file_name = gets.chomp
puts "What column is your data in? (index-wise)"
index = gets.to_i
f = File.new(file_name, "r")
unemployed = f.readlines
f.close
sum = 0
unemploys = []
counter = 0

unemployed.each do |unemploy|
	sum += unemploy.split(",")[index].to_f
	counter += 1
	unemploys.push(unemploy.split(",")[index].to_f)
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

puts "What file would you like to write to?"
write_to_file = gets.chomp
g = File.new(write_to_file, "w")
unemploys.each do |job|
	z = (job - avg)/sd
	g.puts("#{job}, #{z}")
end

g.close
