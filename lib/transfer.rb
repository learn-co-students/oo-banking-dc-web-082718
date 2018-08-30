class Transfer
  # your code here
  @@completed_transfers = []
  attr_accessor :status
  attr_reader :sender, :receiver,:amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? && sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if !@@completed_transfers.include?(self) && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @@completed_transfers << self
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@completed_transfers.include?(self)
      reverse = Transfer.new(@receiver, @sender, @amount)
      reverse.execute_transaction
      @status = "reversed"
    end
  end

end
