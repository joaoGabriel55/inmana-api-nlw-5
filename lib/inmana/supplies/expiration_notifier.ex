defmodule Inmana.Supplies.ExpirationNotifier do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      # Background Job that can throw an exception
      |> Mailer.deliver_later!()
    end)
  end
end
