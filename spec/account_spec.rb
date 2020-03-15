require 'account'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'returns 100 when given 100' do
      expect(account.deposit(100)).to eq(100)
    end

    it 'returns correct balance' do
      account.deposit(100)
      expect(account.deposit(100)).to eq(200)
    end
  end
end
            