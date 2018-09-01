class Transfer
# should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

# A completed transfer can also be reversed and go into a "reversed" status.
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if status == "pending" && sender.balance > @amount
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && @receiver.balance > @amount
      @receiver.withdraw(amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end

end
