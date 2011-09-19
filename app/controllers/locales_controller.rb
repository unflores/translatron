class LocalesController < ApplicationController
  def index
    @locales = Locale.all
  end

  def show
    @locale = Locale.find(params[:id])
  end

  def new
    @locale = Locale.new
  end

  def edit
    @locale = Locale.find(params[:id])
  end

  def create
    @locale = Locale.new(params[:locale])

    if @locale.save
      redirect_to @locale, notice: 'Locale was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @locale = Locale.find(params[:id])

    if @locale.update_attributes(params[:locale])
      redirect_to @locale, notice: 'Locale was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @locale = Locale.find(params[:id])
    @locale.destroy

    redirect_to locales_url
  end
end
