class XmlDocument
  
  def initialize(indent = false)
    @XmlDocument = ""
    @indent = indent
    @indent_num = 0
  end
  
  def method_missing(method_name, *params, &blk)
    if block_given?
      indent('up') if @indent 
      @XmlDocument << "<#{method_name}>"
      @XmlDocument << "\n" if @indent
      @XmlDocument << yield
      indent('down') if @indent
      @XmlDocument << "</#{method_name}>"
      @XmlDocument << "\n" if @indent
    else
      indent('down') if @indent
      @XmlDocument += "<#{method_name.to_s}#{arguments(params)}/>"
      @XmlDocument += "\n" if @indent
    end
    @XmlDocument
  end

  def indent(arg)
    @indent_num.times{ @XmlDocument << " " }
    arg == "up" ? @indent_num += 2 : @indent_num -= 2 
  end 
  
  def arguments(params)
    final =""
    args = params[0] || {}
    args.each { |key, value| final += " #{key}=\"#{value}\"" }
    final
  end
end
