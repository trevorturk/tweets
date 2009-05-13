require 'test_helper'

class CambricTest < ActiveSupport::TestCase

  test "config file loaded" do
    assert Cambric.config
  end

end
