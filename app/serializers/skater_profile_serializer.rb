class SkaterProfileSerializer < ActiveModel::Serializer
  attributes :id, :skater_id, :first_name, :last_name, :avatar_file_path
end