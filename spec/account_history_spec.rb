require './lib/account_history.rb'

RSpec.describe 'Account History' do

  before do
    @history = AccountHistory.new
  end

  it 'account transaction history starts blank' do
    expect(@history.transactions).to eq []
  end

  it 'saves a new transaction' do
    allow(Time).to receive_message_chain('now.strftime').with("%d/%m/%Y").and_return "03/12/2018"
    @history.add_transaction(100, 100)
    expect(@history.transactions).to eq [["03/12/2018",100, 100]]
  end

  it 'prints transaction history' do
    @history.add_transaction(100,100)
    expect(@history.statement).to eq "date || credit || debit || balance\n03/12/2018 || 100 ||  || 100"
  end
end
