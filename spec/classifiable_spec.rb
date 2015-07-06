require 'classifiable'
require 'spec_helper'

describe Classifiable do
  before do
    clean_database
  end

  it 'is awesome' do
    expect(true).to be_truthy
  end  

  it "should have classifications association" do
    s1 = SampleOne.create(name: 'I am Sample One')
    expect(s1).to respond_to(:classifications)
  end

  it 'should generate ' do
    expect(Object.const_defined?('SampleTwo')).to be_truthy
  end

  it 'should generate Classification class' do
    expect(Object.const_defined?('Classification')).to be_truthy
    Classification.create(name: 'pota_mia', status: 'broken')
    Classification.create(name: 'akyat_bahay', status: 'ready')
    expect(Classification.count).to eq(2)
  end

  it "should attach classifications" do
    s2 = SampleTwo.create(name: 'I am Sample 2')
    expect(s2).to respond_to(:classifications)
  end
end