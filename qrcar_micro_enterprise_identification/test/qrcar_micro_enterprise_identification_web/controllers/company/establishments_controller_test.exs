defmodule QrcarMicroEnterpriseIdentificationWeb.Company.EstablishmentsControllerTest do
  use QrcarMicroEnterpriseIdentificationWeb.ConnCase

  alias QrcarMicroEnterpriseIdentification.Company
  alias QrcarMicroEnterpriseIdentification.Company.Establishments

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:establishments) do
    {:ok, establishments} = Company.create_establishments(@create_attrs)
    establishments
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all establishments", %{conn: conn} do
      conn = get(conn, Routes.company_establishments_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create establishments" do
    test "renders establishments when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_establishments_path(conn, :create), establishments: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.company_establishments_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_establishments_path(conn, :create), establishments: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update establishments" do
    setup [:create_establishments]

    test "renders establishments when data is valid", %{conn: conn, establishments: %Establishments{id: id} = establishments} do
      conn = put(conn, Routes.company_establishments_path(conn, :update, establishments), establishments: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.company_establishments_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, establishments: establishments} do
      conn = put(conn, Routes.company_establishments_path(conn, :update, establishments), establishments: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete establishments" do
    setup [:create_establishments]

    test "deletes chosen establishments", %{conn: conn, establishments: establishments} do
      conn = delete(conn, Routes.company_establishments_path(conn, :delete, establishments))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.company_establishments_path(conn, :show, establishments))
      end
    end
  end

  defp create_establishments(_) do
    establishments = fixture(:establishments)
    %{establishments: establishments}
  end
end
