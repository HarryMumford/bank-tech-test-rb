require 'account'

describe Account do
  let(:transaction_instance) { double :transaction_instance, :statement => "correctly formatted statement" }
  let(:account) { Account.new(transaction_instance) }

  describe '#deposit' do
    it 'returns correct balance' do
      account.deposit(100)
      expect(account.deposit(100)).to eq(200)
    end
  end

  describe '#withdraw' do
    it 'returns correct balance' do
      account.deposit(100)
      expect(account.withdraw(50)).to eq(50)
    end
  end

  describe '#print' do
    it 'it outputs the correctly formatted statement' do
      expect { account.print_statement }.to output('correctly formatted statement').to_stdout
    end
  end
end
            