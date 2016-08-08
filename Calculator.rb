def calculate(operation, first_number,second_number)
  if  operation == "+" #renvoie un booléen, true ou false
    result = first_number + second_number
  elsif operation == "*"
    result = first_number * second_number
  else
    result = puts "operation is impossible #{operation}"
  end
  return result
end

