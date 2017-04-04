defmodule ExfiRouter.Cloudtrax.RaGenerator do
  def generate(ra, code, secret) do
    :crypto.hash(:md5, "#{code}#{ra}#{secret}")
      |> Base.encode16
      |> String.downcase
  end
end
