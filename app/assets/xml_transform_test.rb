require 'nokogiri'
doc = Nokogiri::XML(File.read('./results.xml'))
xslt = Nokogiri::XSLT(File.read('./transform.xslt'))
puts xslt.transform(doc)