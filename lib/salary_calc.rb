require "salary_calc/version"
require "salary_calc/conversions/to_hourly"
require "salary_calc/conversions/from_hourly"

module SalaryCalc
  class Calculator
    include Conversions::FromHourly
    include Conversions::ToHourly
    attr_accessor :amount, :billable_hours

    def initialize(amount, billable_hours = 8)
      @amount         = amount
      @billable_hours = billable_hours
    end

    def to_hourly
      amount
    end

    def rounded(result)
      result.round(2)
    end
  end
end
