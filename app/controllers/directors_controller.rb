class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def director_details
  # params looks like {"an_id"=>"42"}
  
  the_id = params.fetch("an_id")

  @the_director = Director.where({ :id => the_id })

    render({ :template => "director_templates/show.html.erb"})
  end






end
