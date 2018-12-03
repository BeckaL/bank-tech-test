require './lib/account.rb'

RSpec.describe 'Account' do
  before do
    @account = Account.new
  end

  it 'initializes with a balance of zero' do
    expect(@account.balance).to eq 0
  end
end
