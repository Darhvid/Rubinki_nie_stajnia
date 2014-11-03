$id_procesu = Array.new(100)
$tier = Array.new(100)
$czas_wykoniania = Array.new(100)
$zalezny = Hash.new

	czy_koniec_wprowadzania = 0
	ktory = 1
	puts "czy chcesz wprowadzić jakiś proces?"
	wprowadzanie = gets.chomp
	
	if wprowadzanie == "tak"
		czy_koniec_wprowadzania = 1
		else
		czy_koniec_wprowadzania = 0 
	end

	while czy_koniec_wprowadzania == 1
		$id_procesu[ktory]=ktory

		puts "jaki jest czas wykoania tego procesu"
		$czas_wykonania = gets.to_i

		puts "czy jest zalezny od jakiegos procesu"
		zal = gets.chomp


		if zal == "tak"
			puts "od jakiego procesu jest zalezny? podaj id jego"
			$zalezny[[ktory,1]] = gets.to_i
			else
			$tier[ktory] = 0
			$zalezny[[ktory,1]] = 0
		end
			
		if zal == "tak"
			x=1	
			
			loop do 
			puts "czy jest zalezny od jeszcze jakiegos od jakiegos proceu?"
			zaldwa = gets.chomp
			
				if zaldwa == "tak"
				x += 1
					puts "od jakiego procesu jest zalezny? podaj id jego"
					$zalezny[[ktory,x]] = gets.chomp
				else
				temp = $zalezny[[ktory,1]]
					$tier[ktory] = $tier[temp]
					$tier[ktory] += 1
					sprawdzeniezaleznosci = 0
				
				end
				
			break if zaldwa == "nie"
					
		end
		
		end
		
		puts "czy chcesz wprowadzić jakiś proces?"
	wprowadzanie = gets.chomp
	puts $zalezny[[ktory,1]]
	puts ktory
	ktory += 1
	if wprowadzanie == "tak"
		czy_koniec_wprowadzania = 1
		else
		czy_koniec_wprowadzania = 0 
	end
	
end