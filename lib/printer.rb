# frozen_string_literal: true

# Prints collections of transaction items to console
class Printer
  def print_statement(transactions)
    output = print_header
    transactions.reverse_each do |transaction|
      output += print_transaction(transaction)
    end
    puts output
  end

  private

  def print_transaction(transaction)
    output = transaction[:date] + ' || '
    output += if transaction[:amount].positive?
                print_credit(transaction)
              else
                print_debit(transaction)
              end
    output + "\n"
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_lines
    output = print_header
    @transactions.reverse_each do |transaction|
      output += print_transaction(transaction)
    end
    print output
  end

  def print_credit(transaction)
    format('%.2f', transaction[:amount]) + ' || || ' + format('%.2f', transaction[:balance])
  end

  def print_debit(transaction)
    '|| ' + format('%.2f', (-transaction[:amount])) + ' || ' + format('%.2f', transaction[:balance])
  end
end
