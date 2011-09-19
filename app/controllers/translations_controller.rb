class TranslationsController < ApplicationController
  before_filter only: ['show', 'edit', 'update', 'destroy']
  
  def index
    @translations = Locale.master.translations.all
  end

  def new
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(params[:translation])

    if @translation.save
      redirect_to @translation, notice: 'Translation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if translation.update_attributes(params[:translation])
      redirect_to translation, notice: 'Translation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    translation.destroy
    redirect_to translations_url
  end
  
  private
  
  def translation
    @translation ||= Translation.find(params[:id])
  end
end
