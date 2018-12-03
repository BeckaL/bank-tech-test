class AccountHistory

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, new_balance)
    @transactions.push([deposit, new_balance])
  end

end
