#make notes tomorrow morning in class.

@count = 10 #"@" is an instance variable while "$" is a global

# called a method in Ruby, in C it's a function except we don't have
# to define the argument and return type
def withdraw (take)
  take = take - 20
  puts "Current balance is: #{take}" #the #{} is % in C, a placeholder
  return take #this returns the result of the function
end

def deposit (give)
  give = give + 20
  puts "Current balance is: #{give}"
  return give
end

def atm
  puts "Do you want to withdraw or deposit 20? W or D?"
  answer = gets.chomp
  if answer == "W"
    withdraw(balance)
  elsif answer == "D"
    deposit(balance)
  else
    print "Thank-you for your service!"
  end
end

while @count > 0
  @count -= 1
  atm
end
