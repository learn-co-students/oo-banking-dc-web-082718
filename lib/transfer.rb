require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    end
  end

  def execute_transaction
    binding.pry
    if valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
