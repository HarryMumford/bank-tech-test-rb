class Account
  def initialize(transaction = Transaction.new)
    @balance = 0
    @transaction_instance = transaction
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail 'Insufficient funds' if amount > @balance
    @balance -= amount
  end

  def print_statement
    print @transaction_instance.statement
  end
end
