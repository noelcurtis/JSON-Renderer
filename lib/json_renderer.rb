class JsonRenderer

  @@instance = JsonRenderer.new
  
  def self.shared_instance
    return @@instance
  end
  
  # Use to render a String into its JSON representation
  def render_string(input_string)
    "\"#{input_string.to_s}\""
  end
  
  # Use to render a Fixnum into its JSON representation
  def render_integer(input_integer)
    "#{input_integer}"
  end
  
  # Use to render a List into its JSON representation
  def render_list(input_list)
    output = "["
    (0..input_list.size).each do |i|
      if input_list[i].class == String
        output += self.render_string(input_list[i])
      end
      if input_list[i].class == Fixnum
        output += self.render_integer(input_list[i])
      end
      if i < input_list.size - 1
        output += ","
      end
    end
    output += "]"
  end
  
  # Use to render a Hash into its JSON representation
  def render_hash(input_hash)
    output = "{"
    (0..input_hash.keys.size).each do |i|
      if input_hash[input_hash.keys[i]].class == String
        output += self.render_string(input_hash.keys[i].to_s) + ":" +self.render_string(input_hash[input_hash.keys[i]])
      end
      if input_hash[input_hash.keys[i]].class == Fixnum
        output += self.render_string(input_hash.keys[i].to_s) + ":" +self.render_integer(input_hash[input_hash.keys[i]])
      end
      if input_hash[input_hash.keys[i]].class == Array
        output += self.render_string(input_hash.keys[i].to_s) + ":" +self.render_list(input_hash[input_hash.keys[i]])
      end
      if input_hash[input_hash.keys[i]].class == Hash
        output += self.render_string(input_hash.keys[i].to_s) + ":" + self.render_hash(input_hash[input_hash.keys[i]])
      end
      if i < input_hash.keys.size - 1
        output += ","
      end
    end
    output += "}"
  end
  
  # Use to render input of type String, Hash, Array or Fixnum
  def render_json(input)
    output = ''
    if input.class == String
      output = self.render_string(input)
    end
    if input.class == Fixnum
      output = self.render_integer(input)
    end
    if input.class == Array
      output = self.render_list(input)
    end
    if input.class == Hash
      output = self.render_hash(input)
    end
    output
  end

end