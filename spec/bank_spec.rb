# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { described_class.new(printer) }
  let(:printer) { double('Printer') }

  context 'when depositing money' do
    it ':deposit' do
      expect { bank.deposit(500, '2019-02-24') }. to change(bank, :balance).by(500)
    end

    it 'does not accept nil values' do
      expect { bank.deposit(nil, '2019-02-24') }.to(raise_error { 'Invalid amount' })
    end

    it 'does not accept negative values' do
      expect { bank.deposit(-500, '2019-02-24') }.to(raise_error { 'Invalid amount' })
    end

    it 'rejects nil dates' do
      expect { bank.deposit(500, nil) }.to(raise_error { 'Invalid date' })
    end
  end

  context 'when withdrawing money' do
    it ':withdrawal' do
      expect { bank.withdraw(1000, '2019-02-24') }.to change(bank, :balance).by(-1000)
    end
    it 'does not accept nil values' do
      expect { bank.withdraw(nil, '2019-02-24') }.to(raise_error { 'Invalid amount' })
    end

    it 'does not accept negative values' do
      expect { bank.withdraw(-500, '2019-02-24') }.to(raise_error { 'Invalid amount' })
    end

    it 'rejects nil dates' do
      expect { bank.withdraw(500, nil) }.to(raise_error { 'Invalid date' })
    end
  end

  context 'when asked to print a statement' do
    it 'delegates to the Printer class' do
      allow(printer).to receive(:print_statement)
      bank.print_statement
      expect(printer).to have_received(:print_statement)
    end
  end
end
