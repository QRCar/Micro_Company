defmodule QrcarMicroEnterpriseIdentification.Company do
  @moduledoc """
  The Company context.
  """

  import Ecto.Query, warn: false
  alias QrcarMicroEnterpriseIdentification.Repo

  alias QrcarMicroEnterpriseIdentification.Company.Organizations

  @doc """
  Returns the list of organizations.

  ## Examples

      iex> list_organizations()
      [%Organizations{}, ...]

  """
  def list_organizations do
    Repo.all(Organizations)
  end

  @doc """
  Gets a single organizations.

  Raises `Ecto.NoResultsError` if the Organizations does not exist.

  ## Examples

      iex> get_organizations!(123)
      %Organizations{}

      iex> get_organizations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organizations!(id), do: Repo.get!(Organizations, id)

  @doc """
  Creates a organizations.

  ## Examples

      iex> create_organizations(%{field: value})
      {:ok, %Organizations{}}

      iex> create_organizations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organizations(attrs \\ %{}) do
    %Organizations{}
    |> Organizations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organizations.

  ## Examples

      iex> update_organizations(organizations, %{field: new_value})
      {:ok, %Organizations{}}

      iex> update_organizations(organizations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organizations(%Organizations{} = organizations, attrs) do
    organizations
    |> Organizations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organizations.

  ## Examples

      iex> delete_organizations(organizations)
      {:ok, %Organizations{}}

      iex> delete_organizations(organizations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organizations(%Organizations{} = organizations) do
    Repo.delete(organizations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organizations changes.

  ## Examples

      iex> change_organizations(organizations)
      %Ecto.Changeset{data: %Organizations{}}

  """
  def change_organizations(%Organizations{} = organizations, attrs \\ %{}) do
    Organizations.changeset(organizations, attrs)
  end

  alias QrcarMicroEnterpriseIdentification.Company.Establishments

  @doc """
  Returns the list of establishments.

  ## Examples

      iex> list_establishments()
      [%Establishments{}, ...]

  """
  def list_establishments do
    Repo.all(Establishments)
  end

  @doc """
  Gets a single establishments.

  Raises `Ecto.NoResultsError` if the Establishments does not exist.

  ## Examples

      iex> get_establishments!(123)
      %Establishments{}

      iex> get_establishments!(456)
      ** (Ecto.NoResultsError)

  """
  def get_establishments!(id), do: Repo.get!(Establishments, id)

  @doc """
  Creates a establishments.

  ## Examples

      iex> create_establishments(%{field: value})
      {:ok, %Establishments{}}

      iex> create_establishments(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_establishments(attrs \\ %{}) do
    %Establishments{}
    |> Establishments.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a establishments.

  ## Examples

      iex> update_establishments(establishments, %{field: new_value})
      {:ok, %Establishments{}}

      iex> update_establishments(establishments, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_establishments(%Establishments{} = establishments, attrs) do
    establishments
    |> Establishments.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a establishments.

  ## Examples

      iex> delete_establishments(establishments)
      {:ok, %Establishments{}}

      iex> delete_establishments(establishments)
      {:error, %Ecto.Changeset{}}

  """
  def delete_establishments(%Establishments{} = establishments) do
    Repo.delete(establishments)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking establishments changes.

  ## Examples

      iex> change_establishments(establishments)
      %Ecto.Changeset{data: %Establishments{}}

  """
  def change_establishments(%Establishments{} = establishments, attrs \\ %{}) do
    Establishments.changeset(establishments, attrs)
  end

end
