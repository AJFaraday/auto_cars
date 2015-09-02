class VehicleProfile

  @@profiles = {}

  attr_accessor :name, :attrs, :image

  def initialize(name, attrs)
    @name = name
    @attrs = attrs
    @image = Gosu::Image.new(
      File.join(
        File.dirname(__FILE__),
        '..', 'images', attrs['image']
      )
    )
  end

  def VehicleProfile.fetch(profile_name)
    return @@profiles[profile_name.to_s] if @@profiles[profile_name.to_s]
    config = YAML.load_file(
      File.join(
        File.dirname(__FILE__),
        '..', 'config', 'vehicle_profiles',
        "#{profile_name}.yml"
      )
    )
    @@profiles[profile_name.to_s] = VehicleProfile.new(profile_name.to_s, config)
    return @@profiles[profile_name.to_s]
  end

  def method_missing(meth, *args, &block)
    if @attrs and @attrs[meth.to_s]
      return @attrs[meth.to_s]
    end
    super
  end

end