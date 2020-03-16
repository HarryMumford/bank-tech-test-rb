class Transaction
  def initialize
    @log = []
  end

  def log_deposit(amount, date = Time.now.stftime("%d/%m/%Y"))
    @log << { type: "deposit", amount: amount, date: date }
  end

  def log_withdrawal(amount, date = Time.now.stftime("%d/%m/%Y"))
    @log << { type: "withdrawal", amount: amount, date: date }
  end
end
