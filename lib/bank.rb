# frozen_string_literal: true

require 'transaction'
# Bank can accept deposits, withdrawals and print statements
class Bank
  def initialize(printer = Printer.new)
    @balance = 0
    @transactions = []
    @printer = printer
  end

  attr_reader :balance

  def deposit(amount, date = Date.today)
    raise 'Invalid amount' if amount <= 0

    record_transaction(amount, date)
  end

  def withdraw(amount, date = Date.today)
    raise 'Invalid amount' if amount <= 0

    record_transaction(-amount, date)
  end

  def print_statement
    @printer.print_statement(@transactions)
  end

  private

  def record_transaction(amount, date)
    raise 'Invalid date' if date.nil?
    raise 'Invalid amount' if amount.nil?

    new_balance = @balance += amount.to_f
    @transactions.push(
      Transaction.new(
        amount: amount.to_f,
        date: date,
        balance: new_balance
      )
    )
  end
end
