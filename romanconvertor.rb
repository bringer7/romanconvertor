def fromRoman(romanNumber)
	$number = 0
	$i = 0
	while $i < romanNumber.length
		$item = romanNumber[$i]
		$next = romanNumber[$i+1]
		$i+=1
		case $item
		when "M"
			$number += 1000
		when "D" 
			case $next
			when "M"
				$number-=500
			else
				$number+=500
			end
		when "C" 
			case $next
			when "D","M"
				$number-=100
			else
				$number+=100
			end
		when "L"
			case $next
			when "C","D","M"
				$number-=50
			else
				$number+=50
			end
		when "X"
			case $next
			when "L","C","D","M"
				$number-=10
			else
				$number+=10
			end
		when "V"
			case $next
			when "X","L","C","D","M"
				$number-=5
			else
				$number+=5
			end
		when "I"
			case $next
			when "V","X","L","C","D","M"
				$number-=1
			else
				$number+=1
			end
		else
			raise TypeError
		end
	end
	return $number
end

def toRoman(arabicNumber)
	$value = ""
	if 0 < arabicNumber
		if arabicNumber < 4000
			while arabicNumber != 0
				case arabicNumber
				when 1000..3999
					$value += "M"
					arabicNumber-=1000
				when 900..999
					$value+="CM"
					arabicNumber-=900
				when 500..999
					$value += "D"
					arabicNumber-=500
				when 400..499
					$value+="CD"
					arabicNumber-=400
				when 100..499
					$value += "C"
					arabicNumber-=100
				when 90..99
					$value+="XC"
					arabicNumber-=90
				when 50..99
					$value += "L"
					arabicNumber-=50
				when 40..49
					$value+="XL"
					arabicNumber-=40
				when 10..49
					$value += "X"
					arabicNumber-=10
				when 9
					$value+="IX"
					arabicNumber-=9
				when 5..8
					$value += "V"
					arabicNumber-=5
				when 4
					$value+="IV"
					arabicNumber-=4
				when 1..4
					$value += "I"
					arabicNumber-=1
				end
			end
			return $value
		else
			raise RangeError
		end
	else
		raise RangeError
	end
end