FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            {
              ", " *
              t "others" =
              {
                " et~al."
              }
              {
                nameptr #1 "Jansen, David A" =
                {
                  "\textbf{" t * "}" *
                }
                {
                  t *
                }
                if$
              }
              if$
            }
          if$
        }
        {
          nameptr #1 "Jansen, David A" =
          {
            "\textbf{" t * "}" *
          }
          {
            t *
          }
          if$
        }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}
