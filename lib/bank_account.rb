class BankAccount
  # one instance of the class can transfer money to another instance through a Transfer class
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    @status = "closed"
  end

end
