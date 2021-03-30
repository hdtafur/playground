defmodule PlaygroundWeb.KumeteStatsLive do
  use PlaygroundWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(3000, self(), :tick)
    {:ok, assign_socket_values(socket)}
  end

  def handle_event("refresh", _params, socket) do
    {:noreply, assign_socket_values(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign_socket_values(socket)}
  end

  defp assign_socket_values(socket) do
    assign(socket, events_count: events_count(), average_response_time: average_response_time())
  end

  defp events_count(), do: Enum.random(1..10)
  defp average_response_time(), do: Enum.random(10..200)
end
