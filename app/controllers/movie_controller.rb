class MovieController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    if url_params.blank?
      redirect_to share_movie_path
    else
      movie = current_user.movies.build(url: url_params)
      if movie.save
        redirect_to root_path
      else
        flash[:error] = "error"
        redirect_to share_movie_path
      end
    end
  end

  def url_params
    params[:youtube_url]
  end
end
