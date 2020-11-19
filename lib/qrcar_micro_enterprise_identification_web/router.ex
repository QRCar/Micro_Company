defmodule QrcarMicroEnterpriseIdentificationWeb.Router do
  use QrcarMicroEnterpriseIdentificationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", QrcarMicroEnterpriseIdentificationWeb do
    pipe_through :api
    resources "/organization", OrganizationsController
    resources "/establishment", EstablishmentsController
  end

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :qrcar_micro_enterprise_identification, swagger_file: "swagger.json", disable_validator: true
  end

  def swagger_info do
    %{
      schemes: ["http", "https", "ws", "wss"],
      info: %{
        version: "1.0",
        title: "MyAPI",
        description: "API Documentation for MyAPI v1",
        termsOfService: "Open for public",
        contact: %{
          name: "Vladimir Gorej",
          email: "vladimir.gore@gmail.com"
        }
      },
      securityDefinitions: %{
        Bearer: %{
          type: "apiKey",
          name: "Authorization",
          description:
            "API Token must be provided via `Authorization: Bearer ` header",
          in: "header"
        }
      },
      consumes: ["application/json"],
      produces: ["application/json"],
      tags: [
        %{name: "Organizations", description: "Organization resources"},
      ]
    }
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: QrcarMicroEnterpriseIdentificationWeb.Telemetry
    end
  end
end
