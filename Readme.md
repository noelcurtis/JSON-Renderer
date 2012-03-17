## JSON Renderer	

### Usage

Use JsonRenderer to render JSON string for Hashes, Lists, Strings and Fixnums in Ruby!

<pre>
@address_hash = {"street" => "somewhere cool", "apt" => "#5", "zip" => "10018"}
JsonRenderer.shared_instance.render_json(@address_hash)
</pre>