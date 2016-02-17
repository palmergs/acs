class TilePicture < ApplicationRecord

  SETTING_FANTASY = "Fantasy"
  SETTING_SCIFI = "Science Fiction"
  SETTING_SPY = "Mystery / Spy"
  ALL_SETTINGS = [ SETTING_FANTASY, SETTING_SPY, SETTING_SCIFI ]

  CATEGORY_WALL = "Wall"
  CATEGORY_PORTAL = "Portal"
  CATEGORY_CREATURE = "Creature"
  CATEGORY_ITEM = "Item"
  CATEGORY_TERRAIN = "Terrain"
  ALL_CATEGORIES = [ CATEGORY_WALL, CATEGORY_PORTAL, CATEGORY_CREATURE, CATEGORY_ITEM, CATEGORY_TERRAIN ]

  belongs_to :adventure

  before_validation do
    self.description = '' unless self.description.present?
  end
end
