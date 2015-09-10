module Layer

  LAYERS = [
    :road,
    :road_paint,
    :vehicle,
    :display,
    :debug
  ]

  def self.[](name)
    LAYERS.index(name) || 100
  end

end