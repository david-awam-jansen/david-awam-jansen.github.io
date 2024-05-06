-- Lua filter that behaves like `--citeproc`
function Pandoc (doc)
  return pandoc.Citeproc(doc)
end
