require 'account'
require 'transaction'
require 'statement'

describe Account do
  it 'User can make multiple transactions and print formatted statement' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)

    header = "date || credit || debit || balance\n"
    line_1 = "#{Time.now.strftime("%d/%m/%Y")} || || 500.00 || 2500.00\n"
    line_2 = "#{Time.now.strftime("%d/%m/%Y")} || 2000.00 || || 3000.00\n"
    line_3 = "#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00\n"

    expect { account.print_statement }.to output(header + line_1 + line_2 + line_3).to_stdout
  end
end
