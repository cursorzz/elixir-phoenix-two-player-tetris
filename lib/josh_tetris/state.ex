defmodule JoshTetris.Game.State do
  alias JoshTetris.Shapes

  defstruct [:board, :next, :current, :rotation, :x, :y]

  def cells_for_shape(state) do
    shape = Shapes.shapes[state.current]

    rotated_shape = shape |> Enum.at(state.rotation)

    for {row, row_i} <- Enum.with_index(rotated_shape) do
      for {col, col_i} <- Enum.with_index(row), col != 0 do
        {col_i + state.x, row_i + state.y}
      end
    end |> List.flatten
  end
  
end