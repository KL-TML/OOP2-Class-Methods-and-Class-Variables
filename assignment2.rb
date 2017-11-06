class BankAccount
  @@interest_rate = 5.0 #float variable to take on decimal values for the interest rate% This is a class variable because it is the same value for all of the accounts
  @@accounts = [] #this starts as an empty array that will store a list of all bank accounts

  #7 creating a Create class
  def self.create #Class Method
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

#8 Creating a total_funds method
  def self.total_funds
    total_balance = 0
    @@accounts.each do |account|
      total_balance += account.balance
    end
    return total_balance
  end

# 9 creating a class method for interest_time
  def self.interest_time
    @@accounts.each do |account|
       account.balance= account.balance*(1 + @@interest_rate/100)
    end
  end

  def self.get_account_number
    @@accounts
  end


  def initialize
    @balance = 0
  end

  # READER methods
  def balance #
    @balance
  end

  # WRITER METHOD
  def balance=(balance_value)
    @balance = balance_value
  end


  #5 Deposit Method
  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  #6 Withdraw Method
  def withdraw(withdraw_amount)
    @balance -= withdraw_amount
  end


end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
