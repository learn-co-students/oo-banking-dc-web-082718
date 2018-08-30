require 'pry'

class Transfer
  attr_reader :sender, :receiver, :status
  attr_accessor :amount

  def initialize (sender, receiver, amount=0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? then return true else return false end
  end

  def execute_transaction
    if @status == "complete" || !valid? then return "Transaction rejected. Please check your account balance." end
    if @sender.balance < @amount then @status = "rejected"; return "Transaction rejected. Please check your account balance." end

    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  def reverse_transfer
    if @status != "complete" then return false end
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end

  def status=(state)
    if @status == "complete" then return false else @status = state end
  end

end
