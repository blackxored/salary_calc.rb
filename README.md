# SalaryCalc

[![Gem Version](https://badge.fury.io/rb/salary_calc.png)](http://badge.fury.io/rb/salary_calc) [![Build Status](https://travis-ci.org/blackxored/salary_calc.rb.png)](https://travis-ci.org/blackxored/salary-calc.rb) [![Coverage Status](https://coveralls.io/repos/blackxored/salary_calc.rb/badge.png?branch=master)](https://coveralls.io/r/blackxored/salary_calc.rb) [![Dependency Status](https://gemnasium.com/blackxored/salary_calc.rb.png)](https://gemnasium.com/blackxored/salary_calc.rb)

A very simple salary calculator.

## Installation

Add this line to your application's Gemfile:

    gem 'salary_calc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install salary_calc

## Usage

Calculating based on an hourly rate, and default 8 billable hours:

```ruby
require 'salary_calc'

calculator = SalaryCalc::Calculator.new(15)
calculator.to_daily   #=> 120
calculator.to_weekly  #=> 600
calculator.to_monthly #=> 2400
calculator.to_yearly  #=> 28800
```

Specify billable hours:

```ruby
calculator = SalaryCalc::Calculator.new(15, 6)
calculator.to_daily = 90
```

Getting the hourly rate for a specific amount different that hourly rate:

```ruby
calculator = SalaryCalc::Calculator.new(15)
calculator.from_yearly(2500)
```

Getting and setting the hourly rate to amount inside the calculator:

```ruby
calculator = SalaryCalc::Calculator.new(2400)
calculator.amount #=> 2400
calculator.from_monthly!
calculator.amount #=> 15
```

Take a look at the tests for more use cases. ;)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
