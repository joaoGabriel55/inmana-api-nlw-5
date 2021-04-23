defmodule Inmana.Supplies.ExpirationNotifier do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()

    # Enum.each(data, fn {to_email, supplies} ->
    #   to_email
    #   |> ExpirationEmail.create(supplies)
    #   # Background Job that can throw an exception
    #   |> Mailer.deliver_later!()
    # end)
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
