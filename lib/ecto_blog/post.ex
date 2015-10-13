defmodule EctoBlog.Post do
  use Ecto.Model

  schema "posts" do
    field :title
    field :content
    field :average_rating, :decimal
    has_many :ratings, EctoBlog.Rating

    timestamps
  end

  def changeset(post, params \\ :empty) do
    post
    |> cast(params, ~w(title), ~w(content))
    |> validate_length(:title, min: 3)
  end
end
