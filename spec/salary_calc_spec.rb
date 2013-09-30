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
      let(:amount)     { 10                          } # the easiest number for math
      let(:calculator) { described_class.new(amount) }

      describe "#to_yearly" do
        it "calculates the yearly salary from an hourly rate" do
          expect(calculator.to_yearly).to eq(19_200)
        end
      end

      describe "#to_monthly" do
        it "calculates the monthly salary from an hourly rate" do
          expect(calculator.to_monthly).to eq(1_600)
        end
      end

      describe "#to_weekly" do
        it "calculates teh weekly salary from an hourly rate" do
          expect(calculator.to_weekly).to eq(400)
        end
      end

      describe "#to_daily" do
        it "calculates the daily salary for an hourly rate" do
          expect(calculator.to_daily).to eq(80)
        end
      end

      describe "#from_yearly" do
        it "returns the hourly rate from a yearly salary" do
          expect(calculator.from_yearly(19_200)).to eq(10)
        end
      end

      describe "#from_monthly" do
        it "returns the hourly rate from a monthly salary" do
          expect(calculator.from_monthly(1_600)).to eq(10)
        end
      end

      describe "#from_weekly" do
        it "returns the hourly rate from a weekly salary" do
          expect(calculator.from_weekly(400)).to eq(10)
        end
      end

      describe "#from_daily" do
        it "returns the hourly rate from a daily salary" do
          expect(calculator.from_daily(80)).to eq(10)
        end
      end

      describe "#from_*_!" do
        it "modifies the calculator's amount to reflect hourly rate" do
          expect(calculator.amount).to eq(10)
          calculator.from_monthly!(2400)
          expect(calculator.amount).to eq(15)
        end

        it "uses the amount from the calculator if none specified" do
          calculator.amount = 2400
          calculator.from_monthly!
          expect(calculator.amount).to eq(15)
        end
      end
    end
  end
end
