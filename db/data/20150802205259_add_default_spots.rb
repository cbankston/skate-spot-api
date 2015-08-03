class AddDefaultSpots < SeedMigration::Migration
  def up
    Spot.create(name: 'Spot 1', lat: 123432, long: 654334, skater_id: 1)
    Spot.create(name: 'Spot 2', lat: 154432, long: 634634, skater_id: 1)
    Spot.create(name: 'Spot 3', lat: 1897832, long: 6787334, skater_id: 1)
    Spot.create(name: 'Spot 4', lat: 543345, long: 237879, skater_id: 1)
    Spot.create(name: 'Spot 5', lat: 34523, long: 86786, skater_id: 1)
  end

  def down
    Spot.where(name: 'Spot 1').destroy_all
    Spot.where(name: 'Spot 2').destroy_all
    Spot.where(name: 'Spot 3').destroy_all
    Spot.where(name: 'Spot 4').destroy_all
    Spot.where(name: 'Spot 5').destroy_all
  end
end
