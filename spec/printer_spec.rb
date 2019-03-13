# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:printer) { described_class.new }

  let(:transactions) do
    [Transaction.new(amount: 1000, date: '10-01-2012', balance: 1000),
     Transaction.new(amount: 2000, date: '13-01-2012', balance: 3000),
     Transaction.new(amount: -500, date: '14-01-2012', balance: 2500)]
  end

  it 'can print a provided set of transactions' do
    expect { printer.print_statement(transactions) }.to output("date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end
end


"date || credit || debit || balance\n2019/02/03 || || 300.00 || 200.00\n2019/02/01 || 500.00 || || 500.00\n"
"date || credit || debit || balance\n03/02/2019 || || 300.00 || 200.00\n01/02/2019 || 500.00 || || 500.00\n"
