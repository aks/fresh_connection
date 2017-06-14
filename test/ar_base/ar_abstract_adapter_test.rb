require "test_helper"

class AbstractAdapterTest < Minitest::Test
  def setup
    ActiveRecord::Base.connection.clear_query_cache
  end

  test "cache_query is correct after master update" do
    old_name = SecureRandom.hex(3)
    user_id = User.create(name: old_name).id

    User.cache do
      new_name = old_name + "1"
      u = User.find(user_id)
      u.name = new_name
      u.save!

      user = User.find(user_id)
      assert_equal user.name, new_name
    end
  end
end

