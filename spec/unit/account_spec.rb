require 'account'

describe Account do
  let(:transaction_instance) { double :transaction_instance, :statement => "correctly formatted statement" }
  let(:account) { Account.new(transaction_instance) }

  describe '#deposit' do
    it 'returns correct balance after 1 deposit' do
      expect(account.deposit(100)).to eq(100)
    end

    it 'returns correct balance after 2 deposits' do
      account.deposit(100)
      expect(account.deposit(100)).to eq(200)
    end
  end

  describe '#withdraw' do
    it 'returns correct balance after 1 deposit' do
      account.deposit(100)
      expect(account.withdraw(50)).to eq(50)
    end

    it 'raises error when withdrawing more than balance' do
      expect { account.withdraw(50) }.to raise_error('Insufficient funds')
    end
  end

  describe '#print' do
    it 'it outputs the correctly formatted statement' do
      expect { account.print_statement }.to output('correctly formatted statement').to_stdout
    end
  end
end
            