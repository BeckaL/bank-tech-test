class Statement

  def account_history(transactions)
    output = transactions.map do |t|
      "\n" + t.map { |_k, value| value }.join(' || ')
    end
    statement_header + output.join('')
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end
end
