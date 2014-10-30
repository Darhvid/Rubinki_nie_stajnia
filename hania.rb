$id_procesu = [nil]
$tier = [nil]
$czas_wykoniania = [nil]
$zalezny = [nil]

czy_koniec_wprowadzania = 0
ktory = 1
puts "czy chcesz wprowadzić jeszcze jakiś proces?"
wprowadzanie = gets.chomp
if wprowadzine == "tak"
czy_koniec_wprowadzania = 1
else
czy_koniec_wprowadzania = 0 
end

while i = 1
$id_procesu << ktory

puts "jaki jest czas wykoania tego procesu"
$czas_wykonania = gets.to_i

puts "czy jest zalezny od jakiegos procesu"
#wprowadzenie zaleznosci itd

if zal == "tak"
puts "od jakiego procesu jest zalezny? podaj id jego"


$tier << $zalezny[ktory] + 1
else
$tier << 0
$zalezny << 0
end

$zalezny = gets.to_i


ktory++
end

 

