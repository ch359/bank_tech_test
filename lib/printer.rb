# frozen_string_literal: true

# Prints collections of transaction items to console
class Printer
  def print_statement(transactions)
    output = assemble_statement(transactions)
    puts output
  end

  private

  def assemble_statement(transactions)
    output = print_header
    ordered_transactions = correct_order(transactions)
    ordered_transactions.each { |transaction| output += print_transaction(transaction) }
    output
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def print_transaction(transaction)
    output = print_date(transaction)
    output += transaction.amount.positive? ? print_credit(transaction) : print_debit(transaction)
    output + "\n"
  end

  def correct_order(transactions)
    transactions.sort_by(&:date).reverse
  end

  def print_date(transaction)
    date = format_date(transaction.date)
    date + ' || '
  end

  def print_credit(transaction)
    format('%.2f', transaction.amount) + ' || || ' + format('%.2f', transaction.balance)
  end

  def print_debit(transaction)
    '|| ' + format('%.2f', -transaction.amount) + ' || ' + format('%.2f', transaction.balance)
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end
end
