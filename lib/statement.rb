class Statement 
  HEADER = "date || credit || debit || balance"

  def initialize(log)
    @log = log
    @formatted_log = []
  end

  def format_statement
    format_entries
    @formatted_log.push(HEADER).reverse.join("\n")
  end

  private

  def format_entries
    @log.map do |entry|
      if entry[:type] == "withdrawal"
        @formatted_log << "#{entry[:date]} || || #{entry[:amount]}.00 || #{entry[:balance]}.00" 
      else
        @formatted_log << "#{entry[:date]} || #{entry[:amount]}.00 || || #{entry[:balance]}.00" 
      end
    end
  end
end
