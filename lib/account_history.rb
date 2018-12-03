class AccountHistory

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(deposit, new_balance)
    date = Time.now.strftime("%d/%m/%Y")
    @transactions.push([date, deposit, new_balance])
  end

  def statement
    st = statement_header
    @transactions.each do |transaction|
      line = []
      line.push(transaction.first)
      withdrawal_or_deposit = transaction[1]
      if withdrawal_or_deposit < 0
        line.push("")
        line.push(withdrawal_or_deposit.abs)
      else
        line.push(withdrawal_or_deposit)
        line.push("")
      end
      p line
      line.push(transaction.last)
      st += "\n#{line.join(' || ')}"
    end
    return st
  end



  private

  def statement_header
    return "date || credit || debit || balance"
  end

end
