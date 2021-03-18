#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# author: phi@gress.ly
# version: 30. Okt. 2012 V 0.1
#
# Description
#
#   Read a LaTeX - table of Contents (TOC) and remove all duplicaten
#   entries. Only the first entry is left
#   eg. From the lines
#      \contentsline {section}{Konzepte der Objektorientierung}{13}
#      \contentsline {section}{Konzepte der Objektorientierung}{13}
#      \contentsline {section}{Konzepte der Objektorientierung}{14}
#      \contentsline {section}{Konzepte der Objektorientierung}{15}
#   only the first line will remain
#

def main()
  lastLine = ""
  line     = STDIN.gets

  while(line)
    
    if(isDuplicate(lastLine, line))
      line = STDIN.gets
    else
      print line
      lastLine = line
      line     = STDIN.gets
    end
  end  
end


##
#prüfe, ob zwei Einträgel den selben Titel gleich nacheinander haben. Wenn so, return "true"
#
def isDuplicate(l1, l2)
   treffer1 = l1.match("\\\\contentsline \\{section\\}\\{\\\\numberline \\{[A-Z0-9\\.]+\\}(.*)\\}\\{([0-9]+)\\}")
  if(treffer1)
    title1 = treffer1[1].strip
  end

   treffer2 = l2.match("\\\\contentsline \\{section\\}\\{(.*)\\}\\{([0-9]+)\\}")
  if(treffer2)
    title2 = treffer2[1].strip
  end

  if(treffer1 && treffer2)
    return title1 == title2;
  else
   return false
  end

end

main()
