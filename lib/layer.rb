module Layer

  LAYERS = [
    :road,
    :vehicle,
    :display
  ]

  def self.[](name)
    LAYERS.index(name) || 100
  end

end