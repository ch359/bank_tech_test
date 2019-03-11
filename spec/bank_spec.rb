# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { Bank.new }

  context 'bank deposit process' do
    it ':deposit' do
      expect { bank.deposit(500) }. to change { bank.balance }.by(500)
    end

    it 'does not accept nil values' do
      expect { bank.deposit(nil) }.to(raise_error { 'Invalid amount' })
    end

    it 'does not accept negative values' do
      expect { bank.deposit(-500) }.to(raise_error { 'Invalid amount' })
    end
  end
end
