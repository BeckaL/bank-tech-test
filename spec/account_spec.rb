require './lib/account.rb'

RSpec.describe 'Account' do
  let(:whole_no_amount){100}
  let(:decimal_amount){50.5}

  before do
    @account = Account.new
  end

  it 'initializes with a balance of zero' do
    expect(@account.balance).to eq 0
  end

  it 'depositing increases balance by the amount deposited' do
    expect{@account.deposit(whole_no_amount)}.to change{@account.balance}.by whole_no_amount
  end

  it 'depositing allows for deposits with decimals' do
    expect{@account.deposit(decimal_amount)}.to change{@account.balance}.by decimal_amount
  end

  it 'withdrawing decreases balance by the amount deposited' do
    @account.deposit(whole_no_amount)
    expect{@account.withdraw(whole_no_amount)}.to change{@account.balance}.by -whole_no_amount
  end

  it 'withdrawing decreases balance by the amount deposited' do
    @account.deposit(whole_no_amount)
    expect{@account.withdraw(decimal_amount)}.to change{@account.balance}.by -decimal_amount
  end


end
