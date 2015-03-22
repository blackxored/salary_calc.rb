module SalaryCalc::Conversions
  module ToHourly
    def from_yearly(yearly)
      rounded(yearly.to_f / 52 / (billable_hours * 5))
    end

    def from_monthly(monthly)
      binding.pry
      rounded(monthly.to_f * 12 / 52 / (billable_hours * 5))
    end

    def from_weekly(weekly)
      rounded(weekly.to_f / (billable_hours * 5))
    end

    def from_daily(daily)
      rounded(daily.to_f / billable_hours)
    end

    [:yearly, :monthly, :weekly, :daily].each do |period|
      define_method("from_#{period}!") do |amount_to_calculate = self.amount|
        self.amount = send("from_#{period}", amount_to_calculate)
      end
    end
  end
end
