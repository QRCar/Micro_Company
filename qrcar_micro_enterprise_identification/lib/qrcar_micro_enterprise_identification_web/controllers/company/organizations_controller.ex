defmodule QrcarMicroEnterpriseIdentificationWeb.OrganizationsController do
  use QrcarMicroEnterpriseIdentificationWeb, :controller
  use PhoenixSwagger

  alias QrcarMicroEnterpriseIdentification.Company
  alias QrcarMicroEnterpriseIdentification.Company.Organizations

  action_fallback QrcarMicroEnterpriseIdentificationWeb.FallbackController

  swagger_path :index do
    get "/organizations"
    description "List of organizations"
    response 200, "Success"
    response 400, "Client Error"
  end

  def index(conn, _params) do
    organizations = Company.list_organizations()
    render(conn, "index.json", organizations: organizations)
  end

  def create(conn, %{"organizations" => organizations_params}) do
    with {:ok, %Organizations{} = organizations} <- Company.create_organizations(organizations_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.organizations_path(conn, :show, organizations))
      |> render("show.json", organizations: organizations)
    end
  end

  def show(conn, %{"id" => id}) do
    organizations = Company.get_organizations!(id)
    render(conn, "show.json", organizations: organizations)
  end

  def update(conn, %{"id" => id, "organizations" => organizations_params}) do
    organizations = Company.get_organizations!(id)

    with {:ok, %Organizations{} = organizations} <- Company.update_organizations(organizations, organizations_params) do
      render(conn, "show.json", organizations: organizations)
    end
  end

  def delete(conn, %{"id" => id}) do
    organizations = Company.get_organizations!(id)

    with {:ok, %Organizations{}} <- Company.delete_organizations(organizations) do
      send_resp(conn, :no_content, "")
    end
  end
end
