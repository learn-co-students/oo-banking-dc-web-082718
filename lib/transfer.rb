
require 'pry'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status
  def initialize(acct1,acct2,amt)
      @sender = acct1
      @receiver = acct2
      @amount = amt
      @status = "pending"
  end

  def valid?
      @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if @status == "pending" && @sender.balance > @amount
          @sender.balance -= @amount
          @receiver.deposit(@amount)
          @status = "complete"
      else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
      if @status == "complete" && @receiver.balance > @amount
          @receiver.balance -= @amount
          @sender.deposit(@amount)
          @status = "reversed"
      end
  end

end
