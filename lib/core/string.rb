class String

  def remove_brackets
    self.gsub(/[\[\]]/, '')
  end

  def add_brackets
    '[' + self + ']'
  end

end