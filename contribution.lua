function Image(img)
    if img.classes:find('contribution',1) then
      local f = io.open("organization-notes/" .. img.src, 'r')
      local doc = pandoc.read(f:read('*a'))
      f:close()
      local contribution = pandoc.utils.stringify(doc.meta.contribution) or "Contribution has not been set"
      local student = pandoc.utils.stringify(doc.meta.student) or "Student has not been set"
      local id = pandoc.utils.stringify(doc.meta.id) or "Student ID has not been set"
      local info = "> **_" .. "Φοιτητής: " .. student .. "_**" .. "\n\n > **_" .. "Αριθμός μητρώου: " .. id .. "_**"
      local text = "\n\n> _" .. contribution .. "_ \n\n" .. info 
      return pandoc.RawInline('markdown',text)
    end
end
