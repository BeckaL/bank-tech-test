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
  end

  describe '#add_transaction' do
    it 'saves a new transaction' do
      @history.add_transaction(deposit, first_balance)
      expect(@history.transactions).to eq(
        [{ date: date, deposit: deposit,
           withdrawal: nil, balance: first_balance }]
      )
    end
  end

  describe '#statement' do
    before do
      @history.add_transaction(deposit, first_balance)
    end

    it 'prints transaction history' do
      expect(@history.statement).to eq(
        "date || credit || debit || balance\n" \
        "#{date} || #{deposit} ||  || #{first_balance}"
      )
    end

    it 'prints longer transaction history' do
      @history.add_transaction(withdrawal, second_balance)
      expect(@history.statement).to eq(
        "date || credit || debit || balance\n" \
        "#{date} || #{deposit} ||  || #{first_balance}\n" \
        "#{date} ||  || #{withdrawal.abs} || #{second_balance}"
      )
    end
  end
end
