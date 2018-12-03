class AccountHistory

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, new_balance)
    date = Time.now.strftime("%d/%m/%Y")
    @transactions.push({date: date, deposit: deposit, new_balance: new_balance})
  end

  def statement
    st = statement_header
    @transactions.each do |t|
      line = []
      line.push(t[:date])
      if t[:deposit] < 0
        line += ["", t[:deposit].abs]
      else
        line += [t[:deposit], ""]
      end
      line.push(t[:new_balance])
      st += "\n#{line.join(' || ')}"
    end
    return st
  end



  private

  def statement_header
    return "date || credit || debit || balance"
  end

end
