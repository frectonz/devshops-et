defmodule DevshopsEt.CompaniesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DevshopsEt.Companies` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{})
      |> DevshopsEt.Companies.create_company()

    company
  end
end
