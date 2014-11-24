require_relative '../lib/mark_of_newton'

describe Symbol_newtona do
	it "test poprawnego wykonania" do
	expect {
	Symbol_newtona.new(5,2)
	}.to_not raise_error
	end
	
	it "blad spowodowny gorna wartoscia mniesza od zera" do
	expect {
	Symbol_newtona.new(-1,0)
	}.to raise_error
	end
	
	it "blad spowodowny dolna wartoscia mniesza od zera" do
		expect {
		Symbol_newtona.new(0,-1)
		}.to raise_error
	end
	
	it "blad spowodowny tym ze gorna wartoscia jest ulamkiem" do
		expect {
		Symbol_newtona.new(0.1,3)
		}.to raise_error
	end
	
	it "blad spowodowny tym ze dolna wartoscia jest ulamkiem" do
		expect {
		Symbol_newtona.new(3,1.5)
		}.to raise_error
	end
	
	describe "#mark" do
		it "sprawdzenie programu dla wartosci 5 i 2 " do
			expect(Symbol_newtona.new(5,2).mark(5,2)).to eq(10)
		end
		
		it "sprawdzenie programu dla wartosci 5 i 0" do
			expect(Symbol_newtona.new(5,0).mark(5,0)).to eq(1)
		end

		it "sprawdzenie programu dla wartosci 5 i 5" do
			expect(Symbol_newtona.new(5,5).mark(5,5)).to eq(1)
		end
	end
	
	describe "#silnia" do
		it "policzenie silni dla wartosci 5" do
			expect(Symbol_newtona.new(1,1).silnia(5)).to eq(120)
		end
		
		it "policzenie silni dla wartosci 4" do
			expect(Symbol_newtona.new(1,1).silnia(4)).to eq(24)
		end
	end
	
end