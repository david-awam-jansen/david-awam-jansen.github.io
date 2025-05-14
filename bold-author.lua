function AuthorInlines(inlines)
  for i, inline in ipairs(inlines) do
    if inline.t == "Str" and inline.text == "Jansen" then
      inlines[i] = pandoc.Strong({inline})
    elseif inline.t == "Str" and inline.text == "David" then
      -- Optionally bold the full name piece by piece
      inlines[i] = pandoc.Strong({inline})
    elseif inline.t == "Str" and (inline.text == "A." or inline.text == "W.") then
      inlines[i] = pandoc.Strong({inline})
    end
  end
  return inlines
end
