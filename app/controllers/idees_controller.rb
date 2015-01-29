class IdeesController < ApplicationController
  def index
    @idees = Idee.all
    render 'pages/intro'
  end

  def show
    @idee = Idee.find(params[:id])
  end

  def new
    @idee = Idee.new
  end

  def edit
    @idee = Idee.find(params[:id])
  end

  def update
    @idee = Idee.find(params[:id])
    if @idee.update(idee_params)
      redirect_to @idee
    else
      render :edit
    end
  end

  def create
    @idee = Idee.new(idee_params)
    if @idee.save
      redirect_to @idee
    else
      render :new
    end
  end

  private

  def idee_params
    params.require(:idee).permit(:titre, :objectif, :description)
  end
end
