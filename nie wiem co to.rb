x = Array.new(10)
y = Array.new(10)
b = Array.new(10)
$det_od_x = 1 


puts "ile bedzie x"
liczba_x = gets.to_i

for i in 0 .. liczba_x - 1
puts "kolejny x"
x[i] = gets.to_i
end

for i in 0 .. liczba_x - 1
puts "podaj kolejny y"
y[i] = gets.to_i
end

pom = liczba_x
pom -= 1
while (pom >= 1)
j = pom -1
while (j>=0)
$det_od_x = $det_od_x * (x[pom]-x[j])
j -= 1
end
pom -= 1
end

puts $det_od_x





mat = Matrix[[7,6], [3,9]]
mat.det()
