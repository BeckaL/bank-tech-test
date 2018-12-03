require_relative "account_history.rb"

class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance, :account_history

  def initialize(account_history = AccountHistory.new())
    @balance = 0
    @account_history = account_history
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount)
  end

  def withdraw(amount)
    raise 'Not enough money in account' if @balance - amount < MINIMUM_BALANCE

    @balance -= amount
    add_transaction(amount)
  end

  def add_transaction(amount)
    @account_history.add_transaction(amount, @balance)
  end
end
