require 'transaction'

describe Transaction do
  let(:statement) { double :statement, :format_statement => 'formatted statement' }
  let(:transaction) { Transaction.new(statement) }

  describe '#log_deposit' do
    it 'logs 1 deposit' do
      deposit_log = { type: "deposit", amount: 100, date: "01/01/2020", balance: 1000 }
      expect(transaction.log_deposit(100, "01/01/2020", 1000)).to eq([deposit_log])
    end

    it 'logs 2 deposits' do
      transaction.log_deposit(200, "02/01/2020", 1000)
      log = [
        { type: "deposit", amount: 200, date: "02/01/2020", balance: 1000 },
        { type: "deposit", amount: 100, date: "01/01/2020", balance: 1000 }
      ]
      expect(transaction.log_deposit(100, "01/01/2020", 1000)).to eq(log)
    end
  end

  describe '#log_withdrawal' do
    it 'logs 1 withdrawal' do
      withdrawal_log = { type: "withdrawal", amount: 100, date: "01/01/2020", balance: 1000}

      expect(transaction.log_withdrawal(100, "01/01/2020", 1000)).to eq([withdrawal_log])
    end

    it 'logs 2 withdrawals' do
      withdrawal_log = [
        { type: "withdrawal", amount: 200, date: "02/01/2020", balance: 1000 },
        { type: "withdrawal", amount: 100, date: "01/01/2020", balance: 1000 }
      ]

      transaction.log_withdrawal(200, "02/01/2020", 1000)
      expect(transaction.log_withdrawal(100, "01/01/2020", 1000)).to eq(withdrawal_log)
    end
  end

  describe '#generate_statement' do
    it 'generates a new statement' do
      expect(transaction.generate_statement).to eq('formatted statement')
    end
  end
end
