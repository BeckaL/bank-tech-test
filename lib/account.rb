class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance, :history

  def initialize(account_history = AccountHistory.new, statement = Statement.new)
    @balance = 0
    @history = account_history
    @statement = statement
  end

  def deposit(amount)
    raise 'Not a valid deposit' unless amount.is_a? Numeric

    @balance += amount
    @history.add_transaction(amount, @balance)
  end

  def withdraw(amount)
    raise 'Not a valid deposit' unless amount.is_a? Numeric
    raise 'Not enough money in account' if @balance - amount < MINIMUM_BALANCE

    @balance -= amount
    @history.add_transaction(-amount, @balance)
  end

  def print_statement
    @statement.account_history(@history.transactions)
  end
end
