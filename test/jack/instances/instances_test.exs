defmodule Jack.InstancesTest do
  use Jack.DataCase

  alias Jack.Instances

  describe "users" do
    alias Jack.Instances.User

    @valid_attrs %{llatitude: 42, longitude: 42}
    @update_attrs %{llatitude: 43, longitude: 43}
    @invalid_attrs %{llatitude: nil, longitude: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instances.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Instances.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Instances.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Instances.create_user(@valid_attrs)
      assert user.llatitude == 42
      assert user.longitude == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instances.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Instances.update_user(user, @update_attrs)
      assert user.llatitude == 43
      assert user.longitude == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Instances.update_user(user, @invalid_attrs)
      assert user == Instances.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Instances.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Instances.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Instances.change_user(user)
    end
  end
end
