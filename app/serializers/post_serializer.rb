class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :lat, :long, :file_path, :url, :skater_id, :up_vote_count, :down_vote_count
end