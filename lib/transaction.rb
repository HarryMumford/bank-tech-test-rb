class Transaction
  def initialize
    @log = []
  end

  def log_deposit(amount, date = formatted_date)
    @log << { type: "deposit", amount: amount, date: date }
  end

  def log_withdrawal(amount, date = formatted_date)
    @log << { type: "withdrawal", amount: amount, date: date }
  end

  private

  def formatted_date
    Time.now.stftime("%d/%m/%Y")
  end
end
