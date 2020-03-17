class Transaction
  def initialize(statement_instance = Statement.new)
    @log = []
    @statement_instance = statement_instance
  end

  def log_deposit(amount, date = formatted_date, balance)
    @log << { type: "deposit", amount: amount, date: date, balance: balance }
  end

  def log_withdrawal(amount, date = formatted_date, balance)
    @log << { type: "withdrawal", amount: amount, date: date, balance: balance }
    p @log
  end

  def generate_statement
    @statement_instance.format_statement(@log)
  end

  private

  def formatted_date
    Time.now.strftime("%d/%m/%Y")
  end
end
