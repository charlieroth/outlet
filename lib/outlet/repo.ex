defmodule Outlet.Accounts.Repo do
  use GenServer

  alias Outlet.Accounts.User

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: Repo)
  end

  @impl true
  def init(_opts) do
    {:ok, %{users: %{}}}
  end

  @impl true
  def handle_call({:list, :users}, _from, state) do
    {:reply, Map.get(state, :users), state}
  end

  @impl true
  def handle_call({:get, :users, id}, _from, state) do
    user = state |> Map.get(:users) |> Map.get(id)
    {:reply, user, state}
  end

  @impl true
  def handle_call({:create, :users, %{"name" => name, "age" => age}}, _from, state) do
    user = %User{id: random_id(), name: name, age: age}

    new_user_state =
      state
      |> Map.get(:users)
      |> Map.put(user.id, user)

    {:reply, user, %{state | users: new_user_state}}
  end

  @impl true
  def handle_cast({:remove, :users, id}, state) do
    new_user_state = state |> Map.get(:users) |> Map.delete(id)
    {:noreply, %{state | users: new_user_state}}
  end

  defp random_id() do
    for _ <- 1..20, into: "", do: <<Enum.random('0123456789abcdef')>>
  end
end
