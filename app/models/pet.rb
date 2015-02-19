class Pet < ActiveRecord::Base
  belongs_to :user

  def self.report_columns
    new.report_attributes.keys.map(&:to_s)
  end

  def report_values
    report_attributes.values
  end

  def report_attributes
    {
      name: name,
      kind: kind,
      weight: weight,
      owner_last_name: user.try(:last_name),
      owner_first_name: user.try(:first_name)
    }
  end
end
