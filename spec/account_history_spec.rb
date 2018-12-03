require './lib/account_history.rb'

RSpec.describe 'Account History' do

  let(:deposit) { 100 }
  let(:first_balance) { 100 }
  let(:withdrawal) { -50 }
  let(:second_balance) { 50 }
  let(:date) { '03/12/2018' }

  before do
    @history = AccountHistory.new
  end

  it 'account transaction history starts blank' do
    expect(@history.transactions).to eq []
  end

  it 'saves a new transaction' do
    allow(Time).to receive_message_chain('now.strftime').with("%d/%m/%Y").and_return date
    @history.add_transaction(deposit, first_balance)
    expect(@history.transactions).to eq [{date: date, deposit: deposit, withdrawal: nil, balance: first_balance}]
  end

  it 'prints transaction history' do
    @history.add_transaction(deposit, first_balance)
    expect(@history.statement).to eq "date || credit || debit || balance\n03/12/2018 || 100 ||  || 100"
  end

  it 'prints longer transaction history' do
    @history.add_transaction(deposit, first_balance)
    @history.add_transaction(withdrawal, second_balance)
    expect(@history.statement).to eq "date || credit || debit || balance\n03/12/2018 || 100 ||  || 100\n03/12/2018 ||  || 50 || 50"
  end
end
