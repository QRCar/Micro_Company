defmodule QrcarMicroEnterpriseIdentificationWeb.EstablishmentsView do
  use QrcarMicroEnterpriseIdentificationWeb, :view
  alias QrcarMicroEnterpriseIdentificationWeb.EstablishmentsView

  def render("index.json", %{establishments: establishments}) do
    %{data: render_many(establishments, EstablishmentsView, "establishments.json")}
  end

  def render("show.json", %{establishments: establishments}) do
    %{data: render_one(establishments, EstablishmentsView, "establishments.json")}
  end

  def render("establishments.json", %{establishments: establishments}) do
    %{id: establishments.id,
      siret: establishments.siret,
      name: establishments.name,
      address: establishments.address,
      zipcode: establishments.zipcode,
      city: establishments.city,
      country: establishments.country,
      phone: establishments.phone,
      organizations_id: establishments.organizations_id,
      master: establishments.master}
  end
end
