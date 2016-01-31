class SlugSupport

  def slugify str
    SlugSupport.slugify(str)
  end

  def namify str
    SlugSupport.namify(str)
  end

  def self.slugify str
    tmp = str.to_s.downcase.strip
    tmp = tmp.gsub(/[[:punct:]\s`$<>^|+=~]+/, '-').gsub(/^[-]+/, '')
    tmp.empty? ? nil : tmp
  end

  def self.namify slug
    tmp = slug.to_s.strip.gsub(/[_-]+/, ' ')
    tmp.empty? ? nil : tmp
  end

end
