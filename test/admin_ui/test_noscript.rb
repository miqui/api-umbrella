require_relative "../test_helper"

class Test::AdminUi::TestNoscript < Minitest::Capybara::Test
  include Capybara::Screenshot::MiniTestPlugin
  include ApiUmbrellaTestHelpers::DelayServerResponses
  include ApiUmbrellaTestHelpers::Setup

  def setup
    setup_server
  end

  def test_noscript_message
    response = Typhoeus.get("https://127.0.0.1:9081/admin/", keyless_http_options)
    assert_response_code(200, response)
    assert_equal("text/html", response.headers["content-type"])

    doc = Nokogiri::HTML(response.body)

    # Ensure there's a <noscript> tag with a message in it.
    assert_match("This application requires JavaScript", doc.xpath("//body//noscript").text)

    # Try to determine the visible text to browsers without javascript enabled
    # to ensure there isn't anything extra (like the "loading..." overlay).
    doc.xpath("//body//script").remove
    doc.xpath("//body//div[contains(@style,'display: none')]").remove
    visible_text = doc.xpath("//body").text
    assert_match(/\A\s*This application requires JavaScript.\s*Here are instructions how to enable JavaScript in your web browser.\s*\z/, visible_text)
    refute_match("Loading", visible_text)
  end

  def test_javascript_loading
    # Slow down the server side responses to validate the "Loading..." spinner
    # shows up (without slowing things down, it periodically goes away too
    # quickly for the tests to catch).
    delay_server_responses(0.5) do
      visit "/admin/"
      assert_content("Loading...")
      refute_content("This application requires JavaScript")
    end
  end
end
