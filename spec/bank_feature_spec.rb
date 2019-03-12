# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { described_class.new }

  context 'when depositing money' do
    it 'increases bank balance on a successful deposit' do
      expect { bank.deposit(1000, '20-01-2019') }.to change(bank, :balance).by(1000)
    end
  end

  context 'when withdrawing money' do
    it 'decreases bank balance on a successful deposit' do
      expect { bank.withdraw(1000, '21-01-2019') }.to change(bank, :balance).by(-1000)
    end
  end

  context 'when printing a statement' do
    it 'shows date, debit & credit amounts and current balance' do
      bank.deposit(500, '2019-02-01')
      bank.withdraw(300, '2019-02-03')
      expect { bank.print_statement }.to output("date || credit || debit || balance
2019-02-03 || || 300.00 || 200.00\n2019-02-01 || 500.00 || || 500.00\n").to_stdout
    end

    it 'mirrors the example output in the specification' do
      bank.deposit(1000, '10-01-2012')
      bank.deposit(2000, '13-01-2012')
      bank.withdraw(500, '14-01-2012')
      expect { bank.print_statement }.to output("date || credit || debit || balance
14-01-2012 || || 500.00 || 2500.00\n13-01-2012 || 2000.00 || || 3000.00
10-01-2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
