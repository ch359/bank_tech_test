# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:bank) { Bank.new }

  context 'bank deposit process' do
    it 'increases bank balance on a successful deposit' do
      expect { bank.deposit(1000) }.to change { bank.balance }.by(1000)
    end
  end
end
