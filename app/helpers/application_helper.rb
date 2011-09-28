module ApplicationHelper

  def all_locales
    @all_locales ||= Locale.all
  end

end
