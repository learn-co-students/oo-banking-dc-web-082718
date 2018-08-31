class Transfer

  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver = sender, receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance > @amount
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = 'reversed'
    end
  end

end
