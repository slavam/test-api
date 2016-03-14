class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :first_name, :last_name, :date_of_birth, :picture, :city, :have_car, :code_token
  has_one :user_state
end
