require './lib/statement.rb'

RSpec.describe '#statement' do
  let(:deposit) { 100 }
  let(:first_balance) { 100 }
  let(:withdrawal) { -50 }
  let(:second_balance) { 50 }
  let(:date) { '03/12/2018' }
  let(:transaction_history_1) { [{date: date, deposit: deposit,
                                withdrawal: nil, balance: first_balance }]
                              }
  let(:transaction_history_2) { [transaction_history_1.first,
                                  { date: date, deposit: nil,
                                    withdrawal: withdrawal.abs, balance: second_balance }
                                ]}

  before do
    @statement = Statement.new
  end

  it 'prints transaction history' do
    expect(@statement.account_history(transaction_history_1)).to eq(
      "date || credit || debit || balance\n" \
      "#{date} || #{deposit} ||  || #{first_balance}"
    )
  end

  it 'prints longer transaction history' do
    expect(@statement.account_history(transaction_history_2)).to eq(
      "date || credit || debit || balance\n" \
      "#{date} || #{deposit} ||  || #{first_balance}\n" \
      "#{date} ||  || #{withdrawal.abs} || #{second_balance}"
    )
  end
end
