class Transfer
  # your code here
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
    else
      false
      end
    end

    def execute_transaction
      if valid? && self.status != "complete"
        #add code transacting
        sender.balance -= self.amount
        receiver.balance += self.amount
      end

      if sender.balance < 0
        sender.balance += self.amount
        receiver.balance -= self.amount
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        self.status = "complete"
      end
    end
    def reverse_transfer
      if self.status == "complete"
        sender.balance += self.amount
        receiver.balance -= self.amount
        self.status = "reversed"
      end
    end





















end
