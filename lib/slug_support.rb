class SlugSupport

  RANDOM_CHARS = ['A'..'Z'] + ['0'..'9']

  def slugify str
    SlugSupport.slugify(str)
  end

  def namify str
    SlugSupport.namify(str)
  end

  def self.slugify str
    return nil unless str

    tmp = str.to_s.downcase.strip
    tmp = tmp.gsub(/[[:punct:]\s`$<>^|+=~]+/, '-').gsub(/^[-]+/, '')
    tmp.empty? ? nil : tmp
  end

  def self.namify slug
    return nil unless slug

    tmp = slug.to_s.strip.gsub(/[_-]+/, ' ')
    tmp.empty? ? nil : tmp
  end

  def self.numberify str, num, length = 32
    return nil if str.nil?

    "#{ str[0..(length - 4)] }#{ '%03d' % num }"
  end

  def self.linify str
    return nil if str.nil?

    str.to_s.gsub(/[\n\t\s]+/, ' ').strip
  end

  def self.random length = 32
    length = 32 unless length && length.to_i > 0
    arr = Array.new(length.to_i) {|idx| RANDOM_CHARS.sample }.join
  end
end
