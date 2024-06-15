defmodule V1Web.Types.User do
  use Absinthe.Schema.Notation

  @desc "Communication Preferences for a User"
  object :comm_preferences do
    field(:likes_emails, :boolean)
    field(:likes_phone_calls, :boolean)
    field(:likes_faxes, :boolean)
  end

  @desc "User info for creation mutation"
  input_object :communication_preferences do
    field(:likes_emails, :boolean)
    field(:likes_phone_calls, :boolean)
    field(:likes_faxes, :boolean)
  end

  @desc "A User w/ Id, Name, Email, and Communication Preferences"
  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:preferences, :comm_preferences)
  end
end
