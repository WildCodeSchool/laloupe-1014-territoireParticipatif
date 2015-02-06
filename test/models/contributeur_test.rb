require 'test_helper'

class ContributeurTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ne doit pas créer un contributeur sans email" do
    contributeur = Contributeur.new(email: '', password: '12345678', password_confirmation: '12345678')
    assert_not contributeur.save
  end

  test "ne doit pas créer un contributeur avec un mot de passe trop court" do
    contributeur = Contributeur.new(email: '', password: '1234', password_confirmation: '1234')
    assert_not contributeur.save
  end

  test "créer un contributeur valide" do
    count = Contributeur.count
    contributeur = Contributeur.new(email: 'contributeur@wcs.fr', password: '12345678', password_confirmation: '12345678')
    assert contributeur.save
    assert Contributeur.count == count + 1
  end
end
