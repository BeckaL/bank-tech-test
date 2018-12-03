require './lib/account.rb'

RSpec.describe 'Account' do
  before do
    @account = Account.new
  end

  it 'initializes with a balance of zero' do
    expect(@account.balance).to eq 0
  end

  it 'allows deposits' do
    @account.deposit(100)
    expect(@account.balance).to eq 100
  end
end
