class Embedded
  include Mongoid::Document
  include Mongoid::Timestamps

  # @return [String] the standardized street returned by smarty streets
  field :param1, type: String
  embedded_in :move, inverse_of: :embedded_one, class_name: 'Move'
  embedded_in :move, inverse_of: :embedded_two, class_name: 'Move'

  #TODO status of address should be passed in from front end
  #validates_inclusion_of :status, allow_blank: true, in: [:valid, :invalid, :apt_needed, :forced]

end
