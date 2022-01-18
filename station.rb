 Станция
# 1. Имеет название, которое указывается при ее создании
# 2. Может принимать поезда (по одному за раз)
# 3. Может возвращать список всех поездов на станции
# 4. Может возвращать список поездов на станции по типу грузовые, пассажирские
# 5. Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  # 1. Имеет название
  attr_reader :name
  # 3. Может возвращать список всех поездов на станции
  attr_reader :trains

  # 1. Имеет название, которое указывается при ее создании
  # 2. Может принимать поезда
  def initialize(name)
    @name = name
    @trains = []
  end

  private

  # 2. Может принимать поезда (по одному за раз)
  def arrival(train)
    # в массив "поезда" добавляем "поезд", который нам передали в методе
    @trains << train
  end

  # 5. Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def departure(train)
    @trains.delete(train)
  end
  
  protected
  
  # 4. Может возвращать список поездов на станции по типу грузовые, пассажирские
  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end
end