defmodule JoshTetris.Game.Interaction do
  alias JoshTetris.Game.State
  alias JoshTetris.Shapes

  def handle_input(original_state, event) do
    new_state = do_handle_input(original_state, event)
    cond do
      valid?(new_state) -> new_state
      :else             -> original_state
    end
  end

  def do_handle_input(state, :move_right) do
    %State{state | x: state.x + 1}
  end

  def do_handle_input(state, :move_left) do
    %State{state | x: state.x - 1}
  end

  def do_handle_input(state, :rotate_cw) do
    %State{state | rotation: rem(state.rotation + 1, 4)}
  end
  
  def do_handle_input(state, _), do: state

  def valid?(%State{x: x}) when x < 0, do: false

  def valid?(%State{}=state) do
    !past_right_side_of_board?(state)    
  end

  def past_right_side_of_board?(state) do
    width = Shapes.width(state.current, state.rotation)
    state.x + width >= 11
  end
  
      
    
end