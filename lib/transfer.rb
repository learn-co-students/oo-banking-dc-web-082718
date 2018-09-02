class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def execute_transaction
    if @status == "pending"
      if @sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        return @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
    return false
  end
end
