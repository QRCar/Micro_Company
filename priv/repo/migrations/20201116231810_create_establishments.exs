defmodule QrcarMicroEnterpriseIdentification.Repo.Migrations.CreateEstablishments do
  use Ecto.Migration

  def change do
    create table(:establishments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :siret, :string
      add :name, :string
      add :address, :string
      add :zipcode, :integer
      add :city, :string
      add :country, :string
      add :phone, :string
      add :organizations_id, :binary_id
      add :master, :boolean, default: false, null: false


      timestamps()
    end

    create unique_index(:establishments, [:siret])
    create unique_index(:establishments, [:address])
  end
end
