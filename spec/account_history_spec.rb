require './lib/account_history.rb'

RSpec.describe 'Account History' do

  before do
    @history = AccountHistory.new
  end

  it 'account transaction history starts blank' do
    expect(@history.transactions).to eq []
  end

  it 'saves a new transaction' do
    @history.add_transaction(100, 100)
    expect(@history.transactions).to eq [[100, 100]]
  end
end
