class String
  def to_gbk
    Iconv.iconv("GBK//IGNORE","UTF-8//IGNORE",self).to_s
  end
  def to_utf8
    Iconv.iconv("UTF-8//IGNORE","GBK//IGNORE",self).to_s
  end
end 