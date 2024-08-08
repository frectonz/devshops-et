defmodule DevshopsEt.Submissions do
  @moduledoc """
  The Submissions context.
  """

  import Ecto.Query, warn: false
  alias DevshopsEt.Repo

  alias DevshopsEt.Submissions.Submission

  def list_submissions do
    Repo.all(Submission)
  end

  def get_submission!(id), do: Repo.get!(Submission, id)

  def create_submission(attrs \\ %{}) do
    %Submission{}
    |> Submission.changeset(attrs)
    |> Repo.insert()
  end

  def delete_submission(%Submission{} = submission) do
    Repo.delete(submission)
  end

  def change_submission(%Submission{} = submission, attrs \\ %{}) do
    Submission.changeset(submission, attrs)
  end
end
