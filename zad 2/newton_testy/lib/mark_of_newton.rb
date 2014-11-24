# -*- coding: utf-8 -*-
class Symbol_newtona
  attr_reader :gora, :dol

  def initialize(gora, dol)
		 if gora < 0
				raise TypeError.new('zla wartosc zmiennej gora')
		elsif dol < 0
				raise TypeError.new('zla wartosc zmiennej dol')
		elsif gora.class != Fixnum
				raise TypeError.new('gora nie jest fixnum')
		elsif dol.class != Fixnum
			raise TypeError.new('dol  nie jest fixnum')
		else
			@gora, @dol = gora, dol
      end
  end
  
  def mark(gora , dol)
	 if dol == 0 or dol == gora
	 symbol = 1
	 else
	 pom = gora - dol
	 symbol = silnia(gora) / ( silnia(dol) * silnia(pom) )
	 end
	 symbol
  end
  
  def silnia(x)
    wynik_silni = 1
	while x>0
	wynik_silni *= x
	x -= 1
	end
	wynik_silni
  end
end