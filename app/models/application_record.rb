class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # validates :email_attributes, email: true
end
