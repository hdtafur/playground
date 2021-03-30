defmodule PlaygroundWeb.KumeteStatsLiveTest do
  use PlaygroundWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Playground.Test.Html

  test "renders stats dashboard with average response time and events count elements", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/kumete-stats")
    assert view |> render() |> Html.parse() |> Html.text("[data-role=dashboard-name]") == "Kumete Stats Dashboard"
    assert view |> render() |> Html.parse() |> Html.text("[data-role=events-count-name]") == "# of events"
    assert view |> render() |> Html.parse() |> Html.text("[data-role=average-response-time-name]") == "Avg response time (ms)"
  end

  test "renders events counts value", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/kumete-stats")
    events_count = view |> render() |> Html.parse() |> Html.text("[data-role=events-count-value]") |> String.to_integer()
    assert Enum.member?(1..10, events_count)
  end

  test "renders average response time value", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/kumete-stats")
    average_response_time = view |> render() |> Html.parse() |> Html.text("[data-role=average-response-time-value]") |> String.to_integer()
    assert Enum.member?(10..200, average_response_time)
  end
end
