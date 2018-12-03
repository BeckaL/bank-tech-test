## User stories

As a bank customer  
So that I can know how much money I have
I want to be able to see my current balance

As a bank customer  
So that I can store money to use later  
I want to be able to deposit money  

As a bank customer  
So that I can spend my cash  
I want to be able to make a withdrawal

As a bank customer  
So that I can keep track of my transactions
I want to be able to see a bank statement

## Before doing any of the below

Clone this repository

``$ cd bank-tech-test``

``$ bundle install``

## To run the tests

``$ rspec``

## Running the programme

`` irb``

Require the account file

`` require './lib/account.rb' ``

Create a new account

`` account = Account.new``

Check your balance

```
$ account.balance

=> 0
```

Add to your balance

```
$account.deposit(100)
$account.balance

=> 100
```


Withdraw from your account

```
$ account.withdraw(50)
$ account.balance

=> 50
```

Print your account statement

```
$ print account.history.statement

=> date || credit || debit || balance
03/12/2018 || 100 ||  || 100
03/12/2018 ||  || 50 || 50
```

## Running linting

``$ rubocop``

## Manual feature test in IRB

![Manual feature tests]('https://github.com/BeckaL/bank-tech-test/blob/master/public/irb_feature_test.png')
