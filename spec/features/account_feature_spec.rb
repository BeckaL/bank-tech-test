require './lib/account_history.rb'
require './lib/account.rb'

describe 'Account' do

  let(:date) { '03/12/2018' }
  let(:first_deposit) { 100 }
  let(:second_deposit) { 50.5 }
  let(:first_withdrawal) { 30 }
  let(:interim_balance) {first_deposit + second_deposit}
  let(:final_balance) {interim_balance - first_withdrawal}

  before do
    allow(Time).to receive_message_chain('now.strftime').with("%d/%m/%Y").and_return date
  end

  it 'creates an account, and makes a number of deposits and withdrawals' do
    account = Account.new

    account.deposit(first_deposit)
    account.deposit(second_deposit)
    account.withdraw(first_withdrawal)

    expect(account.balance).to eq (final_balance)
    expect(account.history.statement).to eq(
      "date || credit || debit || balance\n" +
      "#{date} || #{first_deposit} ||  || #{first_deposit}\n" +
      "#{date} || #{second_deposit} ||  || #{interim_balance}\n" +
      "#{date} ||  || #{first_withdrawal} || #{final_balance}")
    expect { account.withdraw(final_balance + 1) }.to raise_error (
      'Not enough money in account')
  end
end
