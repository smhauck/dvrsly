class PagesController < ApplicationController
  before_action :resume_session, only: [:index]

  allow_unauthenticated_access

  def index
  end

  def about
  end

  def terms
  end

  def privacy
  end

  def faq
  end

  def roadmap
  end
end
