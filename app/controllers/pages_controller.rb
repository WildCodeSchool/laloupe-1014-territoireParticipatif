class PagesController < ApplicationController
  before_action :authenticate_animateur!, only: [:animation]

  def intro
    @projets = Projet.last(4).reverse
  end

  def charte
  end

  def mentions
  end

  def howto
  end

  def animation
  end

end
