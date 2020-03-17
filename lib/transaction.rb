class Transaction
  def initialize(statement_class = Statement)
    @log = []
    @statement_class = statement_class
  end

  def log_deposit(amount, date = formatted_date, balance)
    @log << { type: "deposit", amount: amount, date: date, balance: balance }
  end

  def log_withdrawal(amount, date = formatted_date, balance)
    @log << { type: "withdrawal", amount: amount, date: date, balance: balance }
  end

  def generate_statement
    @statement_class.new(@log).format_statement
  end

  private

  def formatted_date
    Time.now.strftime("%d/%m/%Y")
  end
end
