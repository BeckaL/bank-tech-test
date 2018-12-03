class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance, :history

  def initialize(account_history = AccountHistory.new())
    @balance = 0
    @history = account_history
  end

  def deposit(amount)
    raise 'Not given a valid deposit' unless amount.is_a? Numeric

    @balance += amount
    add_transaction(amount)
  end

  def withdraw(amount)
    raise 'Not given a valid deposit' unless amount.is_a? Numeric
    raise 'Not enough money in account' if @balance - amount < MINIMUM_BALANCE

    @balance -= amount
    add_transaction(-amount)
  end

  def add_transaction(amount)
    @history.add_transaction(amount, @balance)
  end
end
