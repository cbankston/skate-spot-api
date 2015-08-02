class SpotSerializer < ActiveModel::Serializer
  attributes :id, :skater_id, :name, :lat, :long
end