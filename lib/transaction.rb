class Transaction

  attr_reader :amount, :date, :balance

  def initialize(amount:, date:, balance:)
    @amount = amount
    @date = Date.parse(date)
    @balance = balance
  end

end