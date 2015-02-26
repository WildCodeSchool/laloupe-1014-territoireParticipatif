FactoryGirl.define do

  factory :actualite do
    titre "Atelier Tourisme"
    contenu "Du contenu"
    animateur
  end

  sequence :email do |n|
    "contributeur#{n}@wcs.fr"
  end

  sequence :pseudo do |n|
    "contrib_#{n}"
  end

  factory :contributeur do
    email { generate :email }
    pseudo { generate :pseudo }
    password '12345678'
    password_confirmation '12345678'
    charte true
    type 'Contributeur'

    factory :animateur, class: Animateur do
      type 'Animateur'
    end
  end

  factory :commentaire do
    message 'yolo'
    contributeur
    projet
  end

  factory :projet do
    titre "Des cours de code en primaire"
    objectif "Initier les jeunes"
    description "Le code comme outil créatif"
    contributeur
    categorie
  end

  factory :like do
    projet
    contributeur
  end

  factory :categorie do
    nom 'Agriculture'
  end

end
