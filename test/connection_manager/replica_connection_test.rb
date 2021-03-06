require "test_helper"

class ReplicaConnectionTest < Minitest::Test
  def setup
    super
    @cm = FreshConnection::ConnectionManager.new
  end

  def teardown
    @cm.clear_all_connections!
  end

  test "same connection in one thread" do
    c = @cm.replica_connection
    assert_equal @cm.replica_connection, c
  end

  test "multi connections in several thread" do
    threads_num = 5
    threads = []
    threads_num.times do |i|
      threads << Thread.new do
        @cm.replica_connection
      end
    end
    threads.each(&:join)

    connections = @cm.instance_variable_get("@connections")
    assert_equal threads_num, connections.size
    before_connection = nil
    connections.each_value do |c|
      refute_equal before_connection, c
      before_connection = c
    end
  end
end

