# frozen_string_literal: true

# Bank can accept deposits, withdrawals and print statements
class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  attr_reader :balance

  def deposit(amount, date)
    raise 'Invalid amount' if amount <= 0

    record_transaction(amount, date)
  end

  def withdraw(amount, date)
    raise 'Invalid amount' if amount <= 0

    record_transaction(-amount, date)
  end

  def print_statement
    output = print_header
    @transactions.reverse_each do |transaction|
      output += print_transaction(transaction)
    end
    print output
  end

  private

  def record_transaction(amount, date)
    raise 'Invalid date' if date.nil?
    raise 'Invalid amount' if amount.nil?

    new_balance = @balance += amount.to_f
    @transactions.push(
      amount: amount.to_f,
      date: date,
      balance: new_balance
    )
  end

  def print_transaction(transaction)
    output = transaction[:date] + ' || '
    output += if transaction[:amount].positive?
                print_credit(transaction)
              else
                print_debit(transaction)
              end
    output + "\n"
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_credit(transaction)
    format('%.2f', transaction[:amount]) + ' || || ' + format('%.2f', transaction[:balance])
  end

  def print_debit(transaction)
    '|| ' + format('%.2f', (-transaction[:amount])) + ' || ' + format('%.2f', transaction[:balance])
  end
end
