defmodule QrcarMicroEnterpriseIdentificationWeb.EstablishmentsController do
  use QrcarMicroEnterpriseIdentificationWeb, :controller

  alias QrcarMicroEnterpriseIdentification.Company
  alias QrcarMicroEnterpriseIdentification.Company.Establishments

  action_fallback QrcarMicroEnterpriseIdentificationWeb.FallbackController

  def index(conn, _params) do
    establishments = Company.list_establishments()
    render(conn, "index.json", establishments: establishments)
  end

  def create(conn, %{"establishments" => establishments_params}) do
    with {:ok, %Establishments{} = establishments} <- Company.create_establishments(establishments_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.establishments_path(conn, :show, establishments))
      |> render("show.json", establishments: establishments)
    end
  end

  def show(conn, %{"id" => id}) do
    establishments = Company.get_establishments!(id)
    render(conn, "show.json", establishments: establishments)
  end

  def update(conn, %{"id" => id, "establishments" => establishments_params}) do
    establishments = Company.get_establishments!(id)

    with {:ok, %Establishments{} = establishments} <- Company.update_establishments(establishments, establishments_params) do
      render(conn, "show.json", establishments: establishments)
    end
  end

  def delete(conn, %{"id" => id}) do
    establishments = Company.get_establishments!(id)

    with {:ok, %Establishments{}} <- Company.delete_establishments(establishments) do
      send_resp(conn, :no_content, "")
    end
  end
end
