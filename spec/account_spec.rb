require 'account'

describe Account do
  let(:account) { Account.new }

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
end
            