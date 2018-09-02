
class Transfer
attr_accessor :sender, :receiver, :status, :amount
  # your code here

def initialize(sender,receiver,amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end

def valid?
  @sender.valid? && @receiver.valid? && @sender.balance > self.amount
end
#both send and receiver need to be real
#dont be sending money if you don't have any

def execute_transaction
  if self.valid?
    @sender.balance -= @amount
    @receiver.balance += @amount
    @amount -= @amount
    @status = "complete"
  else
     @status = "rejected"
    "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
  if @status == "complete"
     @receiver.balance -= 50
     @sender.balance += 50
     @status = "reversed"
   end
 end



end
