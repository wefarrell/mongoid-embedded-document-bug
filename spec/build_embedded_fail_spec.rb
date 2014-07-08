require 'mongoid'
require_relative '../embedded.rb'
require_relative '../composite.rb'
ENV['MONGOID_ENV'] = 'development'
Mongoid.load!("mongoid.yml")


embedded_one_hash = {
    param1: "param"
}
embedded_two_hash = {
    param1: "param"
}
composite_hash = {
    embedded_one: {
        _id: "53bc3f2976616754d5010000",
        param1: "param"
    },
    embedded_two: {
        _id: "53bc3f2976616754d5020000",
        param1: "param"
    }
}


describe 'Embedded document bug' do
  let(:composite){ Composite.create(composite_hash) }

  before do
    composite.build_embedded_one(embedded_one_hash)
    composite.build_embedded_two(embedded_two_hash)
    composite.save!
  end

  it 'builds two embedded documents and saves the composite' do
    expect(composite.embedded_one.param1).to be(embedded_one_hash[:param1])
  end
end