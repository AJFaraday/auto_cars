module Layer

  LAYERS = [
    :road,
    :road_paint,
    :vehicle,
    :display
  ]

  def self.[](name)
    LAYERS.index(name) || 100
  end

end