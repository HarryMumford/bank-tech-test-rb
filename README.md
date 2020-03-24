# Bank tech test

An example of SOLID code principles. Includes 100% test coverage, fully isolated unit tests and a feature test. 
Time taken: ~ 5 hours

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Approach

I began by drawing class diagrams and identifying the methods I am likely going to need to use. I then wrote down a list of inputs and outputs for each method and then finally began writing the tests in order of increasing complexity. These tests include the following edge cases:

### Edge cases

User cannot withdraw more than balance

### Classes:

Account
  - withdraw
  - deposit
  - print_statement

Transaction
  - log_deposit
  - log_withdrawal
  - generate_statement

Statement
  - format_statement

I structured the code into these main classes. To reduce coupling, I ensured the classes forward responsibility from account to transaction to statement. Account is responsible for handling the transactions. Transaction is responsible for logging the transactions and statement is responsible of formatting the statement.

## Technologies used

### Development
- ruby

### Testing
- rubocop
- rspec
- simplecov

## Installation/ usage

This app runs in irb and provides the user with feedback when calling the methods in the bank class.

To install: 

```
$ git clone git@github.com:HarryMumford/bank-tech-test.git
$ cd bank-tech-test
$ gem install bundle
$ bundle
```

To run app:

```
$ irb
```
*then in irb:*
```
> require './lib/statement.rb'
> require './lib/transaction.rb'
> require './lib/bank.rb'

> bank = Bank.new
> bank.deposit(100)
> bank.withdraw(100)
> bank.print
```
Example from irb:

```
2.6.3 :001 > require './lib/account.rb'
 => true 
2.6.3 :002 > require './lib/transaction.rb'
 => true 
2.6.3 :003 > require './lib/statement.rb'
 => true 
2.6.3 :004 > account = Account.new
 => #<Account:0x00007fa5400d43b8 @balance=0, @transaction_instance=#<Transaction:0x00007fa5400d4390 @log=[], @statement_class=Statement>> 
2.6.3 :005 > account.deposit(100)
 => 100 
2.6.3 :006 > account.deposit(1000)
 => 1100 
2.6.3 :007 > account.withdraw(300)
 => 800 
2.6.3 :008 > account.print_statement
date || credit || debit || balance
24/03/2020 || || 300.00 || 800.00
24/03/2020 || 1000.00 || || 1100.00
24/03/2020 || 100.00 || || 100.00
```

To run tests:

```
$ bundle exec rspec
```

Rspec tests:

```
Account
  User can make multiple transactions and print formatted statement

Account
  #deposit
    returns correct balance after 1 deposit
    returns correct balance after 2 deposits
    it logs 1 deposit
  #withdraw
    returns correct balance after 1 deposit
    raises error when withdrawing more than balance
    it logs 1 withdrawal
  #print
    it outputs the correctly formatted statement

Statement
  #format_statement
    formats the statement correctly

Transaction
  #log_deposit
    logs 1 deposit
    logs 2 deposits
  #log_withdrawal
    logs 1 withdrawal
    logs 2 withdrawals
  #generate_statement
    generates a new statement

Finished in 0.02673 seconds (files took 0.31108 seconds to load)
14 examples, 0 failures
```


To run linter:

```
$ bundle exec rubocop
```

## Future development

given more time I would like to:

- Include the option of creating users with some pin authentication
- Transferring money between users
