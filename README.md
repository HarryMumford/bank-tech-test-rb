# Bank tech test

An un-timed tech-test with the following requirements:

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
User cannot print transactions if empty

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
  - format

I structured the code into these main classes. The bank acts as a controller and passes the responsibility of formatting a single transaction to the transaction class. Here it formats it into a line with the current date. The bank can also call a print method that uses the logic in the statement class to print a correctly formatted statement.

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
$ pry
```
*then in pry:*
```
> require './lib/statement.rb'
> require './lib/transaction.rb'
> require './lib/bank.rb'

> bank = Bank.new
> bank.deposit(100)
> bank.withdraw(100)
> bank.print
```
Screenshot from pry:

<img src='images/pry.png' width='300px'>

To run tests:

```
$ bundle exec rspec
```

Screenshot of rspec tests:

<img src='images/tests.png' width='600px'>


To run linter:

```
$ bundle exec rubocop
```

## Future development

given more time I would like to:

- Include the option of creating users with some pin authentication
- Transferring money between users
