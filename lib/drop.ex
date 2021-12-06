defmodule DropServer do
  use GenServer

  defmodule State do
    defstruct count: 0
  end

  #Вспомогательный метод для запуска
  def start_link do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  #Далее следуют йункции обратного вызоваб
  #которые используются модулем GenServer
  def init([]) do
    {:ok, %State{}}
  end

  def handle_call(request, _from, state) do
    distance = request
    reply = {:ok, fall_velocity(distance)}
    new_state = %State{count: state.count + 1}
    {:reply, reply, new_state}
  end

  def handle_cast(_msg, state) do
    IO.puts("So far, calculated #{state.count} velocities")
    {:noreply, state}
  end

  def handle_info(_info, state) do
    {:noreply, state}
  end

  def terminate(_reason, _state) do
    {:ok}
  end

  def code_change(_old_version, state, _extra) do
    {:ok, state}
  end

  #Функция для внутреннего использования
  def fall_velocity(distance) do
    :math.sqrt(2 * 9.8 * distance)
  end
end
