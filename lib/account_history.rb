class AccountHistory
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, balance)
    date = Time.now.strftime('%d/%m/%Y')
    hash = { date: date, deposit: nil, withdrawal: nil, balance: balance }
    deposit < 0 ? hash[:withdrawal] = deposit.abs : hash[:deposit] = deposit
    @transactions.push(hash)
  end

  def statement
    output = @transactions.map do |t|
      "\n" + t.map { |_k, value| value }.join(' || ')
    end
    statement_header + output.join('')
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end
end
