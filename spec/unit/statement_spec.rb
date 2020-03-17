require 'statement'

describe Statement do

  describe '#format_statement' do
    it 'formats the statement correctly' do
      log = [
        { type: "deposit", amount: 200, date: "02/01/2020", balance: 1000 },
        { type: "withdrawal", amount: 100, date: "01/01/2020", balance: 900 }
      ]

      statement = Statement.new(log)

      output = "date || credit || debit || balance\n01/01/2020 || || 100.00 || 900.00\n02/01/2020 || 200.00 || || 1000.00"

      expect(statement.format_statement).to eq(output)
    end
  end
end