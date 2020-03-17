class Account
  def initialize(transaction = Transaction.new)
    @balance = 0
    @transaction_instance = transaction
  end

  def deposit(amount)
    @balance += amount
    @transaction_instance.log_deposit(amount, @balance)
    @balance
  end

  def withdraw(amount)
    fail 'Insufficient funds' if amount > @balance
    @balance -= amount
    @transaction_instance.log_withdrawal(amount, @balance)
    @balance
  end

  def print_statement
    puts @transaction_instance.generate_statement
  end
end
