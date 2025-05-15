function Div(div)
  if div.identifier:match("^ref%-") then
    print("Found reference div: "..div.identifier)
    return pandoc.walk_block(div, {
      Str = function(el)
        if el.text:match("^Jansen[, %.%s]*$") then
          print("Found name to bold: "..el.text)
          return pandoc.Strong{ pandoc.Str(el.text) }
          end
      end
    })
  end
end
