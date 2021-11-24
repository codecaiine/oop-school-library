class Corrector
  def correct_name(name)
    if name.length <= 10
      name.capitalize
    elsif name.length > 10
      name[0, 10].capitalize
    end
  end
end
