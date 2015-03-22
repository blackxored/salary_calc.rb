require 'spec_helper'
require 'salary_calc'

module SalaryCalc
  describe Calculator do
    context "initialization" do
      it "initializes and exposes amount and billable hours" do
        calculator = described_class.new(2500, 7)
        expect(calculator.amount).to be
        expect(calculator.billable_hours).to be
      end

      it "defaults to 8 billable hours" do
        expect(described_class.new(1).billable_hours).to eq(8)
      end
    end

    context "calculations" do
      let(:amount)     { 60                          }
      let(:calculator) { described_class.new(amount) }

      describe "#to_yearly" do
        it "calculates the yearly salary from an hourly rate" do
          expect(calculator.to_yearly).to eq(124_800)
        end
      end

      describe "#to_monthly" do
        it "calculates the monthly salary from an hourly rate" do
          expect(calculator.to_monthly).to eq(10_400)
        end
      end

      describe "#to_monthly_alternate" do
        it "calculates the monthly salary taking a month as 4 weeks (no overtime)" do
          expect(calculator.to_monthly_alternate).to eq(9_600)
        end
      end

      describe "#to_weekly" do
        it "calculates the weekly salary from an hourly rate" do
          expect(calculator.to_weekly).to eq(2_400)
        end
      end

      describe "#to_daily" do
        it "calculates the daily salary for an hourly rate" do
          expect(calculator.to_daily).to eq(480)
        end
      end

      describe "#from_yearly" do
        it "returns the hourly rate from a yearly salary" do
          expect(calculator.from_yearly(124_800)).to eq(60)
        end
      end

      describe "#from_monthly" do
        it "returns the hourly rate from a monthly salary" do
          expect(calculator.from_monthly(10_400)).to eq(60)
        end
      end

      describe "#from_weekly" do
        it "returns the hourly rate from a weekly salary" do
          expect(calculator.from_weekly(2_400)).to eq(60)
        end
      end

      describe "#from_daily" do
        it "returns the hourly rate from a daily salary" do
          expect(calculator.from_daily(480)).to eq(60)
        end
      end

      describe "#from_*_!" do
        it "modifies the calculator's amount to reflect hourly rate" do
          expect(calculator.amount).to eq(60)
          calculator.from_monthly!(6_000)
          expect(calculator.amount).to eq(34.62)
        end

        it "uses the amount from the calculator if none specified" do
          calculator.amount = 6000
          calculator.from_monthly!
          expect(calculator.amount).to eq(34.62)
        end
      end
    end
  end
end
