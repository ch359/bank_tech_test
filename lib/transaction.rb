# frozen_string_literal: true

# Stores bank transaction data
class Transaction
  attr_reader :amount, :date, :balance

  def initialize(amount:, date:, balance:)
    @amount = amount
    @date = date.is_a?(Date) || Date.parse(date)
    @balance = balance
  end
end
