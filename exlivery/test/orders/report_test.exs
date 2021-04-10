defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Report
  alias Exlivery.Orders.Agent, as: OrderAgent

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "creates report" do
      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")
      res_ex = "123456, pizza, 1, 28.36, pizza, 1, 19.99, 48.35\n"

      assert res_ex == File.read!("report_test.csv")
    end
  end

end
