require "rspec"
require "json_renderer.rb"
require "json"

describe "Render JSON" do
  
  before(:each) do
    @example_list = Array.new
    @example_list << 1
    @example_list << 2
    @example_list << 3
    
    @example_hash = Hash.new
    @example_hash[:name] = "Noel Curtis"
    @example_hash[:phone] = "234-5769298"
    @address_hash = {"street" => "somewhere cool", "apt" => "#5", "zip" => "10018"}
    @example_hash[:address] = @address_hash
    @example_hash[:example_array] = @example_list
    
    @input_string = "AWESOMENESS"
    @input_integer = 3
  end

  it "Should return JSON representation for a String" do
    example_string = "Sample String"
    output = JsonRenderer.shared_instance.render_string(example_string)
    output.should eql(example_string.to_json)
  end
  
  it "Should return JSON representation for a Integer" do
    example_integer = 1
    output = JsonRenderer.shared_instance.render_integer(example_integer)
    output.should eql(example_integer.to_json)
  end
  
  it "Should return JSON representation for an Array/List with integers" do
    output = JsonRenderer.shared_instance.render_list(@example_list)
    output.should eql(@example_list.to_json)
  end
  
  it "Should return JSON representation for an Array/List with integers and strings" do
    another_list = Array.new
    another_list << 1
    another_list << "test_string"
    another_list << "another_test_string"
    
    output = JsonRenderer.shared_instance.render_list(another_list)
    output.should eql(another_list.to_json)
  end
  
  it "Should return a JSON representation for a Hash with integers and strings" do
    output = JsonRenderer.shared_instance.render_hash(@example_hash) 
    output.should eql(@example_hash.to_json)
  end
  
  it "Should be able to render JSON for types: Integer, Array, List & Hash" do
    JsonRenderer.shared_instance.render_json(@example_hash).should eql(@example_hash.to_json)
    JsonRenderer.shared_instance.render_json(@input_string).should eql(@input_string.to_json)
    JsonRenderer.shared_instance.render_json(@example_list).should eql(@example_list.to_json)
    JsonRenderer.shared_instance.render_json(@input_integer).should eql(@input_integer.to_json)
  end
  
end