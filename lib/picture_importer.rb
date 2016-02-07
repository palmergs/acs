class PictureImporter
  attr_accessor :load_path, :save_path, :description

  def initialize path = nil, save_path = nil
    @load_path = path
    @save_path = save_path
    @description = ''
  end

  def process
    if File.directory?(load_path)
      read_description
      visit_directory(load_path)
    else
      load_file(load_path)
    end
  end

  def read_description
    found = [ 'README', 'README.txt', 'README.md', 'LICENSE', 'LICENSE.txt', 'LICENSE.md' ].select do |name|
      File.readable?(File.join(load_path, name))
    end
    self.description = File.read(File.join(load_path, found.first)) if found.count > 0
  end

  def visit_directory dir_path, context = nil
    Dir.foreach(dir_path) do |file|
      unless file.start_with?('.')
        new_path = File.join(dir_path, file)
        if File.directory?(File.join(dir_path, file))
          visit_directory(new_path, file)
        else
          load_file(new_path, context)
        end
      end
    end
  end

  def load_file file_path, context = nil
    if probably_png?(file_path)

      file_name = File.basename(file_path)
      save_name = "#{ Time.now.to_i }.#{ file_name }"
      copy_location = File.join(save_path, save_name)

      image = ChunkyPNG::Image.from_file(file_path)
      if image.width != Picture::WIDTH || image.height != Picture::HEIGHT
        if image.width != Picture::TILE_WIDTH || image.height != Picture::TILE_HEIGHT
          pp "Not a standard file #{ file_path }"
          image.resample_nearest_neighbor(Picture::TILE_WIDTH, Picture::TILE_HEIGHT)
        end
        base = ChunkyPNG::Image.new(48, 64, ChunkyPNG::Color::TRANSPARENT)
        base.compose!(image, Picture::OFFSET_LEFT, Picture::OFFSET_TOP)
        base.save(copy_location, interlace: false)
      else
        FileUtils.cp(file_path, copy_location)
      end

      Picture.create({ name: file_name, description: description, path: copy_location, category: context })
    end
  rescue Exception => e
    pp "ERROR processing #{ file_path } (#{ context})"
  end

  def probably_png? file_path
    File.readable?(file_path) && File.file?(file_path) && file_path.end_with?(".png")
  end
end
