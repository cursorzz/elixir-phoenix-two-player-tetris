defmodule JoshTetris.Websocket do
  @render_interval 100

  def run(game, socket) do
    :timer.send_interval(@render_interval, self, :tick)
    loop(game, socket)
  end
  
  def loop(game, socket) do
    receive do
      :tick ->
        IO.puts "tick"
        Phoenix.Channel.push socket, "tetris:state", JoshTetris.Game.get_state(game)
      _ -> :ok    
    end
    loop(game, socket)
  end
  
end