defmodule AuthEx.Auth.Auth do
  @moduledoc """
  The Auth context.
  """

  @doc """
  Gets a single user.

  """
  def get_user(uid) do
    {:ok, ldap_conn} = Exldap.connect
    {:ok, search_results} = Exldap.search_field(ldap_conn, "uid", uid)
    case search_results do
      [] -> {:error, "Could not find user with uid #{uid}"}
      _ -> search_results |> Enum.fetch(0) |> to_map()
    end
  end


  def authenticate_user(username, plain_text_password) do
    {:ok, ldap_conn} = Exldap.open
    bind = "uid=#{username},dc=example,dc=com"
    case Exldap.verify_credentials(ldap_conn, bind, plain_text_password) do
      :ok -> get_user(username)
      _ -> {:error, "Invalid username / password"}
    end
  end

  defp to_map({:ok, entry}) do
    to_map(entry)
  end

  defp to_map(entry) do
    username = Exldap.search_attributes(entry, "uid")
    name = Exldap.search_attributes(entry, "cn")
    email = Exldap.search_attributes(entry, "mail")
    %{uid: username, name: name, email: email}
  end
end
