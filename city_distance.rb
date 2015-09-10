#Input: A city c from a list of n cities with coordinates
#Output:The k closest cities to c

require 'rubygems'
require 'algorithms'

cities = Hash.new
distances = Containers::MinHeap.new




File.open('C:/Workspace/Projects/cities.txt', 'r') do |f|
	fl = f.readlines
	c = fl[rand(fl.size)].split("\t") #randomly choose city c
	fl.each do |line|
		ary = line.split("\t")
		hy = Math.hypot(c[1].to_f-ary[1].to_f, c[2].to_f-ary[2].to_f)
		cities[ary[0]] = hy
		distances.push(hy)
	end
	puts "Randomly Selected City: #{c[0]}"
	distances.pop #remove city c from the list of closest cities to c
	10.times do
		dist = distances.pop
		puts "#{cities.key(dist)}: #{dist.round(2)} miles"
	end
end
