module GamesHelper
  def clean_html(txt)
    ActionController::Base.helpers.sanitize(txt)
  end
end
