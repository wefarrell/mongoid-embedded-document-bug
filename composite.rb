class Composite
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "moves"

  embeds_one :embedded_one, class_name: 'Embedded', inverse_of: :move
  # @return [Address] the destination address
  embeds_one :embedded_two, class_name: 'Embedded', inverse_of: :move
  # @return [Boolean] the flag to use the hard verification

end
