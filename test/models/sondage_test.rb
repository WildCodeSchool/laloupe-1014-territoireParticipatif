require 'test_helper'

class SondageTest < ActiveSupport::TestCase
  def setup
    @sondage = build(:sondage)
  end

  test "invalide sans contributeur" do
    @sondage.contributeur_id = nil
    assert_not @sondage.valid?
  end

  test "sondage valide" do
    assert @sondage.valid?
  end
end
