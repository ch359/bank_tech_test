# Bank tech test

## Summary

Bank app with basic deposit, withdrawal and statement printing functionality. 

### Instructions for use

- The app is designed to be run from a REPL like `irb`. Please install this locally, alongside `ruby` and the `bundle` gem.
- Clone the repository and execute `bundle install` in the project root to install dependencies. 
- Tests can be run by executing `rspec` in the project root.
- Lint the project by executing `rubocop` in the project root.
- Coverage is provided by `simplecov` and can be found in `coverage/index.html` after running `rspec`.

### Approach

- App has been TDDd, starting with feature tests `spec/bank_feature_spec.rb` and supplemented by unit tests when needed (`spec/*_spec.rb`).
- Periodic refactorings to move functionality out into separate classes.

### Structure

- `Bank`: Interacts with the user. Allows the user to initiate deposits, withdrawals and print a statement of transactions (delegated). 
- `Printer`: Constructs a correctly formatted statement and `puts`'s it to the terminal.
- `Transaction`: Contains the key data for a transaction (date, amount, balance)

### Assumptions


### Points I'd like specific feedback on

- The decision to create a transaction class. Since it's merely a 'repository' for some instance variables, I had resisted the urge to create this to avoid premature optimisation when using a class doesn't add any functionality. 
    - I went with a transaction class because the self feedback form implied it was the right option, but I'm not convinced. Up to this point, the `@transactions` array in `Bank` simply contained a list of hashes, with `amount, date and balance` keys.
    - Would be very interested in your thoughts.
- The decision to use 'real' dates rather than strings
    - It felt a bit bad to leave things as strings even though not in the requirements to do anything other than present the string.
    Your thoughts?
- The testing of private methods
    - I still find the distinction between feature and unit tests unclear in my head.
    - I've clearly primarily feature tested here, but e.g. my Printer class only has a single unit test. 
    - This is because only one method is a public one, and I understand it's best practice to only test the public interface of a class.
    - Can I check you agree with this approach? What about in my review etc. - is it ok to skip testing private methods under 'exam' conditions or will I be risking a "he is not TDDing" comment?
 
 
Include a screenshot of your running app?

## Instructions

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```