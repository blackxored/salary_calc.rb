module SalaryCalc::Conversions
  module FromHourly
    def to_yearly
      rounded(to_weekly * 52)
    end

    # Does not calculate monthly salary based on a 4 week month.
    # Some people define a month as 4 weeks. Use {#to_monthly_alternate}
    # for a version using this assumption.
    # This might be removed in the future.
    def to_monthly
      rounded(amount.to_f * (billable_hours * 5) * 52 / 12)
    end

    def to_monthly_alternate
      rounded(to_weekly * 4)
    end

    def to_weekly
      rounded(to_daily * 5.0)
    end

    def to_daily
      rounded(billable_hours * amount.to_f)
    end
  end
end
