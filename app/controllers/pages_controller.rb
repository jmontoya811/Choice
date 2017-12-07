class PagesController < ApplicationController
  def home
    @blogs = Blog.published
    @skills = Skill.all
  end

  def about
  end

  def contact
  end

  def schedule
  end
end
