class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)`[a-z]{2,})\z/i
  end
end
