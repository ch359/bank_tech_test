# frozen_string_literal: true

# Bank can accept deposits, withdrawals and print statements
class Bank
  def initialize
    @balance = 0
  end

  attr_reader :balance

  def deposit(amount)
    raise 'Invalid amount' if amount.nil? || amount <= 0

    @balance += amount
  end

  def withdrawal(amount)
    raise 'Invalid amount' if amount.nil? || amount <= 0

    @balance -= amount
  end
end
