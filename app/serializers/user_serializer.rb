class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :genre, :birthdate, :phone, :role, :status
end