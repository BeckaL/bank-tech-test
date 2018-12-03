require './lib/account_history.rb'

RSpec.describe 'Account History' do
  before do
    @history = AccountHistory.new
  end

  it 'account transaction history starts blank' do
    expect(@history.transactions).to eq []
  end
end
