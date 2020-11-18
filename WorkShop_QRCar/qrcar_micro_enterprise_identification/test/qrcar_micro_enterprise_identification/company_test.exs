defmodule QrcarMicroEnterpriseIdentification.CompanyTest do
  use QrcarMicroEnterpriseIdentification.DataCase

  alias QrcarMicroEnterpriseIdentification.Company

  describe "organisations" do
    alias QrcarMicroEnterpriseIdentification.Company.Oraganizations

    @valid_attrs %{/: "some /", name: "some name", siren: "some siren"}
    @update_attrs %{/: "some updated /", name: "some updated name", siren: "some updated siren"}
    @invalid_attrs %{/: nil, name: nil, siren: nil}

    def oraganizations_fixture(attrs \\ %{}) do
      {:ok, oraganizations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_oraganizations()

      oraganizations
    end

    test "list_organisations/0 returns all organisations" do
      oraganizations = oraganizations_fixture()
      assert Company.list_organisations() == [oraganizations]
    end

    test "get_oraganizations!/1 returns the oraganizations with given id" do
      oraganizations = oraganizations_fixture()
      assert Company.get_oraganizations!(oraganizations.id) == oraganizations
    end

    test "create_oraganizations/1 with valid data creates a oraganizations" do
      assert {:ok, %Oraganizations{} = oraganizations} = Company.create_oraganizations(@valid_attrs)
      assert oraganizations./ == "some /"
      assert oraganizations.name == "some name"
      assert oraganizations.siren == "some siren"
    end

    test "create_oraganizations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_oraganizations(@invalid_attrs)
    end

    test "update_oraganizations/2 with valid data updates the oraganizations" do
      oraganizations = oraganizations_fixture()
      assert {:ok, %Oraganizations{} = oraganizations} = Company.update_oraganizations(oraganizations, @update_attrs)
      assert oraganizations./ == "some updated /"
      assert oraganizations.name == "some updated name"
      assert oraganizations.siren == "some updated siren"
    end

    test "update_oraganizations/2 with invalid data returns error changeset" do
      oraganizations = oraganizations_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_oraganizations(oraganizations, @invalid_attrs)
      assert oraganizations == Company.get_oraganizations!(oraganizations.id)
    end

    test "delete_oraganizations/1 deletes the oraganizations" do
      oraganizations = oraganizations_fixture()
      assert {:ok, %Oraganizations{}} = Company.delete_oraganizations(oraganizations)
      assert_raise Ecto.NoResultsError, fn -> Company.get_oraganizations!(oraganizations.id) end
    end

    test "change_oraganizations/1 returns a oraganizations changeset" do
      oraganizations = oraganizations_fixture()
      assert %Ecto.Changeset{} = Company.change_oraganizations(oraganizations)
    end
  end

  describe "establishments" do
    alias QrcarMicroEnterpriseIdentification.Company.Establishments

    @valid_attrs %{/: "some /", address: "some address", city: "some city", country: "some country", master: true, name: "some name", phone: "some phone", siret: "some siret", zipcode: 42}
    @update_attrs %{/: "some updated /", address: "some updated address", city: "some updated city", country: "some updated country", master: false, name: "some updated name", phone: "some updated phone", siret: "some updated siret", zipcode: 43}
    @invalid_attrs %{/: nil, address: nil, city: nil, country: nil, master: nil, name: nil, phone: nil, siret: nil, zipcode: nil}

    def establishments_fixture(attrs \\ %{}) do
      {:ok, establishments} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_establishments()

      establishments
    end

    test "list_establishments/0 returns all establishments" do
      establishments = establishments_fixture()
      assert Company.list_establishments() == [establishments]
    end

    test "get_establishments!/1 returns the establishments with given id" do
      establishments = establishments_fixture()
      assert Company.get_establishments!(establishments.id) == establishments
    end

    test "create_establishments/1 with valid data creates a establishments" do
      assert {:ok, %Establishments{} = establishments} = Company.create_establishments(@valid_attrs)
      assert establishments./ == "some /"
      assert establishments.address == "some address"
      assert establishments.city == "some city"
      assert establishments.country == "some country"
      assert establishments.master == true
      assert establishments.name == "some name"
      assert establishments.phone == "some phone"
      assert establishments.siret == "some siret"
      assert establishments.zipcode == 42
    end

    test "create_establishments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_establishments(@invalid_attrs)
    end

    test "update_establishments/2 with valid data updates the establishments" do
      establishments = establishments_fixture()
      assert {:ok, %Establishments{} = establishments} = Company.update_establishments(establishments, @update_attrs)
      assert establishments./ == "some updated /"
      assert establishments.address == "some updated address"
      assert establishments.city == "some updated city"
      assert establishments.country == "some updated country"
      assert establishments.master == false
      assert establishments.name == "some updated name"
      assert establishments.phone == "some updated phone"
      assert establishments.siret == "some updated siret"
      assert establishments.zipcode == 43
    end

    test "update_establishments/2 with invalid data returns error changeset" do
      establishments = establishments_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_establishments(establishments, @invalid_attrs)
      assert establishments == Company.get_establishments!(establishments.id)
    end

    test "delete_establishments/1 deletes the establishments" do
      establishments = establishments_fixture()
      assert {:ok, %Establishments{}} = Company.delete_establishments(establishments)
      assert_raise Ecto.NoResultsError, fn -> Company.get_establishments!(establishments.id) end
    end

    test "change_establishments/1 returns a establishments changeset" do
      establishments = establishments_fixture()
      assert %Ecto.Changeset{} = Company.change_establishments(establishments)
    end
  end

  describe "organizations" do
    alias QrcarMicroEnterpriseIdentification.Company.Organizations

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def organizations_fixture(attrs \\ %{}) do
      {:ok, organizations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_organizations()

      organizations
    end

    test "list_organizations/0 returns all organizations" do
      organizations = organizations_fixture()
      assert Company.list_organizations() == [organizations]
    end

    test "get_organizations!/1 returns the organizations with given id" do
      organizations = organizations_fixture()
      assert Company.get_organizations!(organizations.id) == organizations
    end

    test "create_organizations/1 with valid data creates a organizations" do
      assert {:ok, %Organizations{} = organizations} = Company.create_organizations(@valid_attrs)
    end

    test "create_organizations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_organizations(@invalid_attrs)
    end

    test "update_organizations/2 with valid data updates the organizations" do
      organizations = organizations_fixture()
      assert {:ok, %Organizations{} = organizations} = Company.update_organizations(organizations, @update_attrs)
    end

    test "update_organizations/2 with invalid data returns error changeset" do
      organizations = organizations_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_organizations(organizations, @invalid_attrs)
      assert organizations == Company.get_organizations!(organizations.id)
    end

    test "delete_organizations/1 deletes the organizations" do
      organizations = organizations_fixture()
      assert {:ok, %Organizations{}} = Company.delete_organizations(organizations)
      assert_raise Ecto.NoResultsError, fn -> Company.get_organizations!(organizations.id) end
    end

    test "change_organizations/1 returns a organizations changeset" do
      organizations = organizations_fixture()
      assert %Ecto.Changeset{} = Company.change_organizations(organizations)
    end
  end

  describe "establishments" do
    alias QrcarMicroEnterpriseIdentification.Company.Establishments

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def establishments_fixture(attrs \\ %{}) do
      {:ok, establishments} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_establishments()

      establishments
    end

    test "list_establishments/0 returns all establishments" do
      establishments = establishments_fixture()
      assert Company.list_establishments() == [establishments]
    end

    test "get_establishments!/1 returns the establishments with given id" do
      establishments = establishments_fixture()
      assert Company.get_establishments!(establishments.id) == establishments
    end

    test "create_establishments/1 with valid data creates a establishments" do
      assert {:ok, %Establishments{} = establishments} = Company.create_establishments(@valid_attrs)
    end

    test "create_establishments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_establishments(@invalid_attrs)
    end

    test "update_establishments/2 with valid data updates the establishments" do
      establishments = establishments_fixture()
      assert {:ok, %Establishments{} = establishments} = Company.update_establishments(establishments, @update_attrs)
    end

    test "update_establishments/2 with invalid data returns error changeset" do
      establishments = establishments_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_establishments(establishments, @invalid_attrs)
      assert establishments == Company.get_establishments!(establishments.id)
    end

    test "delete_establishments/1 deletes the establishments" do
      establishments = establishments_fixture()
      assert {:ok, %Establishments{}} = Company.delete_establishments(establishments)
      assert_raise Ecto.NoResultsError, fn -> Company.get_establishments!(establishments.id) end
    end

    test "change_establishments/1 returns a establishments changeset" do
      establishments = establishments_fixture()
      assert %Ecto.Changeset{} = Company.change_establishments(establishments)
    end
  end
end
