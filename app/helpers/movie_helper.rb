module MovieHelper
  def video_info(movie)
    video = Yt::Video.new(id: movie.youtube_video_id)
    {
      title: video.title,
      description: video.description,
    }
  end

  def description_util_view(content)
    content.gsub(/\n/, '<br/>')
  end
end
