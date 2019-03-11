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

  def withdrawal(amount, date)
    raise 'Invalid amount' if amount <= 0

    record_transaction(-amount, date)
  end

  private

  def record_transaction(amount, date)
    raise 'Invalid date' if date.nil?
    raise 'Invalid amount' if amount.nil?

    new_balance = @balance += amount
    @transactions.push(
      amount: amount,
      date: date,
      balance: new_balance
    )
  end
end
