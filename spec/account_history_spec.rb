require './lib/account_history.rb'

RSpec.describe 'Account History' do
  let(:deposit) { 100 }
  let(:first_balance) { 100 }
  let(:withdrawal) { -50 }
  let(:second_balance) { 50 }
  let(:date) { '03/12/2018' }

  before do
    allow(Time).to receive_message_chain('now.strftime').with('%d/%m/%Y')
                                                        .and_return date
    @history = AccountHistory.new
    @history.add_transaction(deposit, first_balance)
  end

  describe '#add' do
    it 'saves a deposit' do
      expect(@history.transactions).to eq(
        [{ date: date, deposit: deposit,
           withdrawal: nil, balance: first_balance }]
      )
    end

    it 'saves a withdrawal' do
      @history.add_transaction(withdrawal, second_balance)
      expect(@history.transactions[1]).to eq(
        { date: date, deposit: nil,
          withdrawal: withdrawal.abs, balance: second_balance }
      )
    end
  end
end
