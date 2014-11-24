$id_procesu = Array.new(100)
$czas_wykonania = Array.new(100)
$zalezny = Hash.new

	 	 def zamien(x, y)
		pom = $czas_wlaczenia[x]
		$czas_wlaczenia[x] = $czas_wlaczenia[y]
		$czas_wlaczenia[y] = pom
		
		pom = $id_procesu[x]
		$id_procesu[x] = $id_procesu[y]
		$id_procesu[y] = pom
		
		pom = $czas_wykonania[x]
		$czas_wykonania[x] = $czas_wykonania[y]
		$czas_wykonania[y] = pom
		
	end
	
	def sortuj
	i = 1
	loop do
		n=0
		for i in 1 .. ($ktory-2)
		
			if $czas_wlaczenia[i] >  $czas_wlaczenia[i+1]
				zamien(i, i+1)
				n=1
			end
		end	
	break if n == 0
	end
	end

puts "numery procesow od ktorych proces wprowadzany jest zalezny podawaj rosnaco\n\n"
	czy_koniec_wprowadzania = 0
	$ktory = 1
	puts "czy chcesz wprowadzić jakiś proces?\n\n"
	wprowadzanie = gets.chomp
	
	if wprowadzanie == "tak"
		czy_koniec_wprowadzania = 1
		else
		czy_koniec_wprowadzania = 0 
	end

	while czy_koniec_wprowadzania == 1
		$id_procesu[$ktory]=$ktory

		puts "jaki jest czas wykoania tego procesu?"
		$czas_wykonania[$ktory] = gets.to_i
		
		puts "czy jest zalezny od jakiegos procesu?\n\n"
		zal = gets.chomp


		if zal == "tak"
		x=1
			puts "od jakiego procesu jest zalezny? podaj id jego\n\n"
			$zalezny[[$ktory,1]] = gets.to_i
			if $zalezny[[$ktory,1]] >= $ktory
				puts" bledne wprowadzone dane! proces nie bedzie zalezny od zadnego procesu "
				$zalezny[[$ktory,1]] = nil
			x -=1	
			end	
			else
			$zalezny[[$ktory,1]] = 0
		end
		$zalezny[[$ktory,2]] = nil	
		if zal == "tak"
					
			
			loop do 
			puts "czy jest zalezny od jeszcze jakiegos od jakiegos proceu?\n\n"
			zaldwa = gets.chomp
			
				if zaldwa == "tak"
					x += 1
					puts "od jakiego procesu jest zalezny? podaj id jego\n\n"
					$zalezny[[$ktory,x]] = gets.to_i
					if $zalezny[[$ktory,x]] >= $ktory
					puts" bledne wprowadzone dane!"
					$zalezny[[$ktory,x]] = nil
					x -=1
					end	
				end
				$zalezny[[$ktory,x+1]] = nil
			break if zaldwa != "tak"
					
		end
		
		end
		
		puts "czy chcesz wprowadzić jakiś proces?\n\n"
		wprowadzanie = gets.chomp
	$ktory += 1
	if wprowadzanie == "tak"
		czy_koniec_wprowadzania = 1
		else
		czy_koniec_wprowadzania = 0 
	end
	
end

$czas_wlaczenia = Array.new(100)


id_zliczanie = 1


while id_zliczanie != $ktory


if $zalezny[[id_zliczanie,1]] == 0
$czas_wlaczenia[id_zliczanie] = 0
else

id_czas = 1
while $zalezny[[id_zliczanie,id_czas]] != nil
$czas_wlaczenia[id_zliczanie] = 0
czas_pomocnicza = $zalezny[[id_zliczanie,id_czas]]
czas_temp = $czas_wlaczenia[czas_pomocnicza] + $czas_wykonania[czas_pomocnicza]

	if $czas_wlaczenia[id_zliczanie] < czas_temp
	$czas_wlaczenia[id_zliczanie] = czas_temp
	end
	id_czas +=1
	end
	
end
id_zliczanie +=1
end

sortuj()

max_time =  $czas_wlaczenia[($ktory-1)] + $czas_wykonania[($ktory-1)]
$harmonogram = Hash.new
aktualny_czas=0


for i in 0 .. 1000
	for j in 0 .. 1000
	$harmonogram[[i,j]] = 0
	end
end
maszyna = 0
for x in 1 .. $ktory-1
zapisane = 0
wiersze = 0
loop do
czas_rozpoczecia_procesu = $czas_wlaczenia[x]
if $harmonogram[[czas_rozpoczecia_procesu,wiersze]] == 0
	for y in czas_rozpoczecia_procesu .. (czas_rozpoczecia_procesu + $czas_wykonania[x]-1)
	$harmonogram[[y,wiersze]] = x
	zapisane = 1
	end
	else 
	wiersze += 1
	maszyna += 1
end
break if zapisane == 1
end
end


for j in 0 .. maszyna
	for i in 0 .. max_time-1
	print $harmonogram[[i,j]] 
	end
	puts 
end