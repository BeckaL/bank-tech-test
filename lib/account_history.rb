class AccountHistory

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, new_balance)
    date = Time.now.strftime('%d/%m/%Y')
    @transactions.push({ date: date, deposit: deposit, balance: new_balance })
  end

  def statement
    statement = statement_header
    @transactions.each do |t|
      line = [(t[:date])]
      line += withdrawal?(t[:deposit]) ? ['', -t[:deposit]] : [t[:deposit], '']
      line << t[:balance]
      statement += "\n#{line.join(' || ')}"
    end
    return statement
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end

  def withdrawal?(amount)
    amount < 0
  end

end
