module SalaryCalc::Conversions
  module ToHourly
    def from_yearly(yearly)
      from_monthly(yearly.to_f / 12)
    end

    def from_monthly(monthly)
      from_weekly(monthly.to_f / 4)
    end

    def from_weekly(weekly)
      from_daily(weekly.to_f / 5)
    end

    def from_daily(daily)
      daily / billable_hours.to_f
    end

    [:yearly, :monthly, :weekly, :daily].each do |period|
      define_method("from_#{period}!") do |amount_to_calculate = self.amount|
        self.amount = send("from_#{period}", amount_to_calculate)
      end
    end
  end
end
