class Transfer

	attr_accessor :sender, :receiver, :amount, :bank_account, :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		if self.sender.valid? && self.receiver.valid?
			true
		else
			false
		end
	end

	def execute_transaction
		if self.status == "pending" && (sender.balance - @amount) >= 0
			sender.balance -= @amount
			receiver.balance += @amount
			self.status = "complete"
		else
			self.status = "rejected"
			return "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if self.status == "complete"
			sender.balance += @amount
			receiver.balance -= @amount
		end
		self.status = "reversed"
	end


end
