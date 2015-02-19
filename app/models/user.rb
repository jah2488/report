require 'csv'
class User < ActiveRecord::Base
  has_many :meals
  has_many :pets

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_first
    "#{last_name}, #{first_name}"
  end

  def report_values
    report_attributes.values
  end

  def self.report_columns
    new.report_attributes.keys.map(&:to_s)
  end

  def report_attributes
    Hash[%w(first_name last_name favorite_color age).zip(
           [first_name, last_name, favorite_color, age])]
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values
      end
    end
  end
end
