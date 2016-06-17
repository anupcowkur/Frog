require 'test_helper'

class LinksUpdaterTest < Minitest::Test
  def setup
    @links_updater = LinksUpdater.new
    @timestamp_file_path = @links_updater.timestamp_file_path
    @links_file_path = @links_updater.links_file_path
    @fake_time_now = "2016-06-15T15:13:18+05:30"
  end

  def test_updates_links_if_older_than_a_month
    fake_last_updated = "2016-02-15T15:13:18+05:30"
    fake_links = "fake links"

    # Stub timestamp reading from file
    File.stubs(:read).with(@timestamp_file_path).returns(fake_last_updated)

    # Stub DateTime.now
    DateTime.stubs(:now).returns(DateTime.parse(@fake_time_now))

    # Mock HTTP response with fake links
    mock_response = mock()
    Net::HTTP.stubs(:get_response).with(URI.parse(Constants::LINKS_URL)).returns(mock_response)
    mock_response.stubs(:body).returns(fake_links)

    # Set expectations:
    # Expect that dummy links will be written to links file path
    File.expects(:write).with(@links_file_path, fake_links)
    # Expect that fake timestamp will be written to last updated file path
    File.expects(:write).with(@timestamp_file_path, @fake_time_now)

    # Call the method under test
    @links_updater.update_links_if_needed
  end

  def test_exits_if_update_fails_due_to_network_error
    fake_last_updated = "2016-02-15T15:13:18+05:30"
    fake_links = "fake links"

    # Stub timestamp reading from file
    File.stubs(:read).with(@timestamp_file_path).returns(fake_last_updated)

    # Stub DateTime.now
    DateTime.stubs(:now).returns(DateTime.parse(@fake_time_now))

    # Stub exiter
    Exiter.any_instance.stubs(:exit_due_to_net_http_fail_during_links_update)

    # Mock HTTP response to raise exception
    Net::HTTP.stubs(:get_response).with(URI.parse(Constants::LINKS_URL)).raises(Net::HTTPBadResponse)

    # Set expectations:
    Exiter.any_instance.expects(:exit_due_to_net_http_fail_during_links_update)

    # Call the method under test
    @links_updater.update_links_if_needed
  end

  def test_does_not_update_links_if_not_older_than_a_month
    fake_last_updated = "2016-06-12T15:13:18+05:30"

    # Stub timestamp reading from file
    File.stubs(:read).with(@timestamp_file_path).returns(fake_last_updated)

    # Stub DateTime.now
    DateTime.stubs(:now).returns(DateTime.parse(@fake_time_now))

    # Set expectations:
    # Expect that it'll not update links from website or overwrite the timestamp
    @links_updater.expects(:update_links_from_website).never
    @links_updater.expects(:update_timestamp).never

    # Call the method under test
    @links_updater.update_links_if_needed
  end
end
