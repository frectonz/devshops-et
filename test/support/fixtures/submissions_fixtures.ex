defmodule DevshopsEt.SubmissionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DevshopsEt.Submissions` context.
  """

  @doc """
  Generate a submission.
  """
  def submission_fixture(attrs \\ %{}) do
    {:ok, submission} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url"
      })
      |> DevshopsEt.Submissions.create_submission()

    submission
  end
end
