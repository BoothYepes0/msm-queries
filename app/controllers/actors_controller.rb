class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all

    render({ :template => "actor_templates/index.html.erb"})
  end


  def actor_id
  @actor_id = params.fetch("actor_id")
  @the_actor = Actor.where({ :id => @actor_id }).at(0)
  @character_list = Character.where({:actor_id => @actor_id})
  @movie_id_list = @character_list.map_relation_to_array(:movie_id)
  @movies_list = Movie.where({:id => @movie_id_list})
  

  #@filmography = Movie.where({ :id => @actor_id })
  #@roles = Character.where({ :id => @the_actor })
    render({ :template => "actor_templates/show.html.erb"})
  end


end
