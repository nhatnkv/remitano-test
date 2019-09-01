class MovieController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    if get_video_id.blank?
      redirect_to share_movie_path
    else
      movie = current_user.movies.build(youtube_video_id: get_video_id)
      if movie.save
        redirect_to root_path
      else
        flash[:error] = "error"
        redirect_to share_movie_path
      end
    end
  end

  def get_video_id
    url = params[:youtube_video_id]
    url = url.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if url[2] != nil
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0];
    else
      id = url;
    end
    @get_video_id ||= id
  end
end
