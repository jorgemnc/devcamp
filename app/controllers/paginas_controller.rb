class PaginasController < ApplicationController
  def home
  	@temas=Skill.all
  end

  def about
  end

  def contact
  end
end
