
$tablica = [nil]

	 	 def zamien(x, y)
		pom = $tablica[x]
		$tablica[x] = $tablica[y]
		$tablica[y] = pom
	end
	
	def sortuj
	i = 0
	loop do
		n=0
		for i in 0 .. ($tablica.length-2)
			if $tablica[i] >  $tablica[i+1]
				zamien(i, i+1)
				n=1
			end
		end	
	break if n == 0
	end
	end
	
		 i = 0
		 print "ile liczb ma być w tablicy? \n "
		 ile = gets.to_i
		 while i < ile
		 puts "podaj wartosc na #{i+1} miejscu w tablicy\n"
		 if i == 0
		 $tablica[0] = gets.to_i
		 else
		 $tablica << gets.to_i
		 end 
		 i += 1
		 end
		 
		 sortuj()
		 
		 puts "tak wyglada posortowana tablica: \n"
		 for i in 0 .. $tablica.length
		 print $tablica[i] , "  "
		 end
	 
	 
	
