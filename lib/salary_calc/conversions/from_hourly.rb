module SalaryCalc::Conversions
  module FromHourly
    def to_yearly
      to_monthly * 12
    end

    def to_monthly
      to_weekly * 4
    end

    def to_weekly
      to_daily * 5
    end

    def to_daily
      billable_hours * amount
    end
  end
end
