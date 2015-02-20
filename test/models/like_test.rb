require 'test_helper'

class LikeTest < ActiveSupport::TestCase

  setup do
    @contrib = create(:contributeur)
    @projet = create(:projet)
    @like = build(:like, contributeur: @contrib, projet: @projet)
  end

  test "un like sans projet ne se créé pas" do
    @like.projet = nil
    assert_not @like.valid?
  end

  test "un like sans contributeur ne se créé pas" do
    @like.contributeur = nil
    assert_not @like.valid?
  end

  test "un utilisateur ne peut pas liker 2 fois le même projet" do
    @like.save
    like = build(:like, contributeur: @contrib, projet: @projet)
    assert_not like.valid?
  end

  test "un utilisateur peut liker plusieurs projets" do
    @like.save
    like = build(:like, contributeur: @contrib)
    assert like.valid?
  end

  test "un like valide" do
    assert @like.valid?
  end
end
