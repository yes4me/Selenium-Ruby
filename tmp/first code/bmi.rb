print "What is your height in inches?  "
height = gets

print "What is your weight in pounds?  "
weight = gets

bmi = 703 * ((weight.to_f)/(height.to_f**2))

puts "Your BMI is: " + sprintf("%0.2f",bmi)

if (bmi < 18.5)
  puts "Underweight!"
elsif (bmi < 25)
  puts "Normal weight"
elsif (bmi < 30)
  puts "Overweight"
else
  puts "Obese"
end