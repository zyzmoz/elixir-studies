defmodule FlightBooking.Bookings.ReportTest do
  use ExUnit.Case

  import FlightBooking.Factory

  alias FlightBooking.Bookings.Report
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  describe "create/1" do
    setup  do
      BookingAgent.start_link(%{})

      :ok
    end

    test "create report" do
      :booking
      |>build()
      |> BookingAgent.save()

      Report.create("report_test.csv")

      expected = "1,2000-01-01 23:00:07,Brazil,Canada,1\n"

      assert File.read!("report_test.csv") == expected
    end
  end
end
