defmodule JoshTetris.GameChannel do
  
  use Phoenix.Channel

  def join("game:play", _auth_msg, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    {:ok, game} = JoshTetris.Game.start
    spawn(fn() -> JoshTetris.Websocket.run(game, socket) end)
    {:noreply, socket}
  end
  
  
end