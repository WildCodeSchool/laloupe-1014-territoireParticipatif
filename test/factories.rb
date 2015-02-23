FactoryGirl.define do
  sequence :email do |n|
    "contributeur#{n}@wcs.fr"
  end

  factory :contributeur do
    email { generate :email }
    password '12345678'
    password_confirmation '12345678'
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
