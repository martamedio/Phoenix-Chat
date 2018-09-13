defmodule ChatWeb.MeetupChannel do
  use ChatWeb, :channel

  def join("meetup:lobby", payload, socket) do
    send(self(), :after_join)
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (meetup:lobby).
  def handle_in("shout", payload, socket) do
    Chat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do 
    Chat.Message.get_messages() 
      |> Enum.each(fn msg -> push(socket, "shout", %{
        name: msg.name,
        message: msg.message
      }) end)
      {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
