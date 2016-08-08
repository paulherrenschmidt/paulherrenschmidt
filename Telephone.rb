class Telephone

  def initialize(brand, batterie)
    @brand = brand
    @batterie = batterie
  end

  def ring
    return "riiiiiiiiinnnnnggg"
  end
end

tel = Telephone.new("apple", "moc")
p tel.ring
p tel
