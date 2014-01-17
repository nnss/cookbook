class SitemapController < ApplicationController
  skip_before_filter :require_user, only: [:show]
  def show
    # grab info about all the photos since they each have their own page
    @recipes = Recipe.all

    # grab info about the most recently-updated link as they share a page
    #@link = Link.first :order => 'update_at desc'
  end
end
