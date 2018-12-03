class AccountHistory

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, balance)
    date = Time.now.strftime('%d/%m/%Y')
    @transactions.push({ date: date, deposit: deposit, balance: balance })
  end

  def statement
    statement = statement_header
    @transactions.each do |t, k, v|
      line = t.map { |k, v| v }
      line[1] < 0 ? line.insert(1, "") : line.insert(2, "")
      statement += "\n#{line.join(' || ')}"
    end
    return statement
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end

end
