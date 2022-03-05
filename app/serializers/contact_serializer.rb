class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  link(:self) {contact_path(object.id)}
  link(:kind) {kind_path(object.kind.id)}

  meta do
    { author: "Gabriel Alves"}
  end

  def attributes(*args)
    h = super(*args)
    #h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
end
end
