class Transaction
  def initialize(statement_instance = Statement.new)
    @log = []
    @statement_instance = statement_instance
  end

  def log_deposit(amount, date = formatted_date)
    @log << { type: "deposit", amount: amount, date: date }
  end

  def log_withdrawal(amount, date = formatted_date)
    @log << { type: "withdrawal", amount: amount, date: date }
  end

  def generate_statement
    @statement_instance.format_statement(@log)
  end

  private

  def formatted_date
    Time.now.stftime("%d/%m/%Y")
  end
end
