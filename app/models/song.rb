class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_name }, uniqueness: { scope: :release_year }
  validate :true_release
  validate :year_release_year



  def true_release
    if released && release_year.blank?
      errors.add(:true_release, "The year cannot be blank if song is released")
    end
  end

  def year_release_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:year_release_year, "The release year must be before current year")
    end
  end
end
