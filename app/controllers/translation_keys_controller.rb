class TranslationKeysController < ApplicationController
  def index
    @translations = Translation.master_translations
  end

  def show
    @translation_key = TranslationKey.find(params[:id])
  end

  def new
    @translation_key = TranslationKey.new
  end

  def edit
    @translation_key = TranslationKey.find(params[:id])
  end

  def create
    translation_params                = params[:translation_key].delete(:translation)
    translation_params[:needs_update] = false
    translation_params[:locale_id]    = Locale.master.id
        
    @translation_key = TranslationKey.new(params[:translation_key])
    @translation_key.translations.build(translation_params)
    
    if @translation_key.save
      redirect_to @translation_key, notice: 'Translation key was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @translation_key = TranslationKey.find(params[:id])

    if @translation_key.update_attributes(params[:translation_key])
      redirect_to @translation_key, notice: 'Translation key was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @translation_key = TranslationKey.find(params[:id])
    @translation_key.destroy

    redirect_to translation_keys_url
  end
end
