require 'account'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'returns 100 when given 100' do
      expect(account.deposit(100)).to eq(100)
    end
  end
end
            