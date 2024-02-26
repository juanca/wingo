require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [700, 900], options: {
    browser: :remote,
    url: "http://selenium:4444",
  }
end
