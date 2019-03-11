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
      expect { bank.withdrawal(1000, '21-01-2019') }.to change(bank, :balance).by(-1000)
    end
  end
end
