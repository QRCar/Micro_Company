defmodule QrcarMicroEnterpriseIdentification.Company.Establishments do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "establishments" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :master, :boolean, default: false
    field :name, :string
    field :phone, :string
    field :siret, :string
    field :zipcode, :integer
    #field :organizations_id, :binary_id
    #belongs_to :organizations, QrcarMicroEnterpriseIdentification.Company.Organizations

    timestamps()
  end

  @doc false
  def changeset(establishments, attrs) do
    establishments
    |> cast(attrs, [:siret, :name, :address, :zipcode, :city, :country, :phone, :master, :organizations_id])
    |> validate_required([:siret, :name, :address, :zipcode, :city, :country, :phone, :master, :organizations_id])
    |> unique_constraint(:siret)
    |> unique_constraint(:address)
    |> unique_constraint(:organizations_id)
  end
end