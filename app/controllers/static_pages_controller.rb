class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to highlights_url
    end
  end

  def purpose
  end

  def install
  end
end
