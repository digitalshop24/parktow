class Parking < ActiveRecord::Base
  belongs_to :device
  before_create :deactivate_previous

  def self.deactivate
  	where(active: true).update_all(active: false)
  end

  def deactivate
  	update(active: false)
  end

  private
  def deactivate_previous
  	device.parkings.deactivate if device
  end
end
