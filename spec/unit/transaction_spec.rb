require 'transaction'

describe Transaction do
  # let(:statement) { double :statement, :format_statement => 'formatted statement' }
  let(:transaction) { Transaction.new }

  describe '#log' do
    it 'logs 1 deposit' do
      expect(transaction.log_deposit(100, "01/01/2020")).to eq([{ type: "deposit", amount: 100, date: "01/01/2020" }])
    end

    it 'logs 2 deposits' do
      transaction.log_deposit(200, "02/01/2020")
      log = [
        { type: "deposit", amount: 200, date: "02/01/2020" },
        { type: "deposit", amount: 100, date: "01/01/2020" }
      ]
      expect(transaction.log_deposit(100, "01/01/2020")).to eq(log)
    end
  end
end
