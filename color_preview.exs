#!/usr/bin/env elixir

Mix.install([:yaml_elixir])

# TODO: use pattern matching for the yaml file

defmodule ColorPreview do
  @moduledoc """
  Usage:
      color_preview.exs <filename>

  Options:
      --help      print this output
  """

  defp read_color_scheme(path) do
    path
    |> YamlElixir.read_from_file!()
    |> Map.get("palette", %{})
    |> Enum.sort()
    |> Enum.each(&process_line/1)
  end

  defp process_line({name, <<"#", hex::binary-6>> = color}) do
    <<r_hex::binary-2, g_hex::binary-2, b_hex::binary-2>> = hex

    r = String.to_integer(r_hex, 16)
    g = String.to_integer(g_hex, 16)
    b = String.to_integer(b_hex, 16)

    block = "\e[48;2;#{r};#{g};#{b}m      #{IO.ANSI.reset()}"

    IO.puts([name, " ", block, " ", color])
  end

  @args [help: :boolean]
  def main(args) do
    {parsed, args} = OptionParser.parse!(args, strict: @args)
    cmd(parsed, args)
  end

  defp cmd(_parsed, [path]) do
    path |> read_color_scheme()
  end

  defp cmd([help: true], _) do
    IO.puts(@moduledoc)
  end

  defp cmd(_parsed, _args) do
    IO.puts(@moduledoc)
    System.stop(1)
  end
end

ColorPreview.main(System.argv())
