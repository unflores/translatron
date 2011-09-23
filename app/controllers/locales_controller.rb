class LocalesController < ApplicationController
  def index
    @locales = Locale.all
  end

  def show
    locale
  end

  def new
    @locale = Locale.new
  end

  def edit
    locale
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

    if locale.update_attributes(params[:locale])
      redirect_to @locale, notice: 'Locale was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    locale.destroy

    redirect_to locales_url
  end
  
  private
  
  def locale
    return @locale if @locale.present?
    
     #if not id assume it is the code piece
    @locale = if params[:id].to_s.match('[0-9]+').present?
      Locale.find_by_id(params[:id])
    else
      Locale.find_by_code(params[:id])
    end
    
  end
  
end
