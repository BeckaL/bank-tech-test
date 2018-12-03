require './lib/account.rb'

def atm
  account = Account.new
  account_history = account.account_history
  menu_choice = "Welcome to MakersBank. What would you like to do?\n1. View your balance\n2.Deposit cash\n3.Withdraw cash\n4.View statement\nType 'quit' to exit"
  choice = ''
  while choice != 'quit'
    puts menu_choice
    selection = gets.chomp
    case selection
    when '1'
      puts "Your balance is #{account.balance}"
    when '2', '3'
      action = selection == '2' ? 'deposit' : 'withdrawal'
      puts "Please enter #{action} amount"
      amount = gets.chomp.to_i
      action == 'deposit' ? account.deposit(amount) : account.withdraw(amount)
    when '4'
      puts account_history.statement
    when 'quit' then break
    end
  end
end

atm
