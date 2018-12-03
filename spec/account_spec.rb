require './lib/account.rb'

RSpec.describe 'Account' do
  before do
    @account = Account.new
  end

  it 'initializes with a balance of zero' do
    expect(@account.balance).to eq 0
  end

  it 'depositing increases balance by the amount deposited' do
    expect{@account.deposit(100)}.to change{@account.balance}.by 100
  end

  it 'depositing allows for deposits with decimals' do
    expect{@account.deposit(50.5)}.to change{@account.balance}.by 50.5
  end


end
