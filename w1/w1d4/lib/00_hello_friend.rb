class Friend
  def greeting(who=nil)
    formatted = who.nil? ? "" : ", #{who}" 
    "Hello#{formatted}!"
  end
end