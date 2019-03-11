# frozen_string_literal: true

# Bank can accept deposits, withdrawals and print statements
class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  attr_reader :balance

  def deposit(amount, date)
    raise 'Invalid amount' if amount.nil? || amount <= 0
    raise 'Invalid date' if date.nil?

    new_balance = @balance += amount
    @transactions.push(
      amount: amount,
      date: date,
      balance: new_balance
    )
  end

  def withdrawal(amount, date)
    raise 'Invalid amount' if amount.nil? || amount <= 0
    raise 'Invalid date' if date.nil?

    new_balance = @balance -= amount
    @transactions.push(
      amount: -amount,
      date: date,
      balance: new_balance
    )
  end
end
