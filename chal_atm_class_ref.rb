### CLASSES ###

# ATM for Eazee bank
class Atm
  def initialize(location, atm_balance)
    @location = location
    @atm_balance = atm_balance
  end

  attr_accessor :location, :atm_balance

  # adjusts balance of ATM amount from 34
  def dispense(amount)
    @atm_balance -= amount
  end

  # Adjusts balance of ATM amount from 42
  def deposit(amount)
    @atm_balance += amount
  end
end

# Class for different accounts
class Account
  def initialize(account_num, user, balance)
    @account_num = account_num
    @user = user
    @balance = balance
  end

  attr_accessor :account_num, :name, :balance

  #withdraw money and adjusts user accoun if enough funds
  # Amount from 70
  def withdraw(amount, atm_num)
    if @balance >= amount
      atm_num.dispense(amount)
      @balance -= amount
      display_bal
    else
      print "Sorry, insufficient funds. Get a job."
    end
  end

  # Adjust's users account if deposit
  # Amount from 74
  def deposit(amount, atm_num)
    atm_num.deposit(amount)
    @balance += amount
    display_bal
  end

  def display_bal
    puts "Current balance is: #{@balance}"
  end

end

### METHODS ###

# The interface and decision making branches where the methods are called
# Customer and atm_num come from 96
def atm(customer, atm_num)
  # Could perform check for pincode and exits if pincode is incorrect
  puts "Welcome to Eaze Bank ATM, please select from the following functions:"
  print """
  \t*(W)ithdraw
  \t*(D)eposit
  \t*(B)alance
  \t*(E)xit
  """
  answer = gets.chomp.upcase
  if answer == "W"
    # Withdraw sent to the account class
    # Then to the Atm class if check passed
    # Could perform a various other checks
    print "How much would you like to withdraw? "
    amount = gets.chomp.to_i
    customer.withdraw(amount, atm_num)
  elsif answer == "D"
    # Deposit sent to the account class
    # Then to the Atm class to change atm balance
    # Could wait on the check to see if money has been inserted
    print "How much would you like to deposit? "
    amount = gets.chomp.to_i
    customer.deposit(amount, atm_num)
  elsif answer == "B"
    # Display balance for the customers account1
    customer.display_bal
  elsif answer == "E"
    # Return is to be used to exit a method and break to exit a loop
    return
  else
    # Error checking 
    print "That's not valid option. "
    puts "Please choose a valid option."
  end
end

##### PROGRAM #####

# This creates 2 objects of the Atm and Account class
atm_1 = Atm.new("Sydney", 5000)
customer_1 = Account.new(1, "John", 500)
count = 1

# This program works, but I want to move the question as to whether the transaction
# has been finished
while count > 0

  atm(customer_1, atm_1)

  print "Do you want to finish transaction? Y or N? "
  answer = gets.chomp.upcase
  if answer == 'Y'
    break
  end
end
