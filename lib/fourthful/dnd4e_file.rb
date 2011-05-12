class Fourthful
  class DND4E_File
    attr_accessor :doc
    
    def initialize(doc)
      @doc = XmlSimple.xml_in(doc)
    end
  end
end
