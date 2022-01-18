require "./station"
require "./route"
require "./passenger_train"
require "./cargo_train"

class RailRoad
  attr_accessor :stations, :route, :trains

  # у железной дороги есть
  #  - список станций 
  #  - список маршрутов 
  #  - список поездов 
  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def list_stations
    @stations.each.with_index do |station, index|
      puts "#{index}: Станция #{station.name}"
    end
  end

  def list_routes
    @routes.each.with_index do |route, index|
      puts "#{index}: Маршрут #{route.name}"
    end
  end

  def list_trains(train_type)
    @trains.each.with_index do |train, index|
      puts "#{index}: Поезд #{train.number}" if train.type == train_type
    end
  end
  
  protected

  # метод для поиска станции
  # - в аргументах передаем имя станции
  # - ищем в списке станций по переданному имени
  # - возвращает найденную станцию из списка станций
  def find_station(name)
    @stations.find { |station| station.name == name }
  end
  
  public

  # метод для создания станции
  # - создает новую станцию
  # - добавляет станцию в список станций
  # - возвращает созданную станцию
  def create_station(name)
    new_station = Station.new(name) 
    @stations << new_station
    new_station
  end

  # Добавляем станцию по названию станции, если она еще не создана
  # Возвращаем существующую станцию (объект класса), если она уже есть с таким именем
  # или создаем и возвращаем новую станцию
  # (используем предыдущие два метода)
  def add_station(name)
    station = find_station(name) # вернет станцию или nil
    return station if station

    create_station(name)
  end
  
  protected

  # метод для поиска маршрута по имени
  def find_route(name)
    @routes.find { |route| route.name == name }
  end

  # метод создает и возвращает новый маршрут с указанием первой и последней станций
  # добавляет созданный маршрут в список маршрутов
  def create_route(name, first_station, last_station)
    route = Route.new(name, first_station, last_station)
    @routes << route 
    route
  end

  def add_route(name, first_station, last_station)
    route = find_route(name)
    return route if route

    create_route(name, first_station, last_station)
  end
  
  # метод для поиска поезда по его номеру
  def find_train(train_number, train_type)
    @trains.find { |train| train.number == train_number && train.type = train_type}
  end

  # создаем поезд указанного типа, по умолчанию - пассажирский
  # добавляем созданный поезд в список поездов
  # возвращаем созданный поезд
  def create_train(train_number, train_type)
    train =
      if train_type == :cargo
        CargoTrain.new(train_number)
      else
        PassengerTrain.new(train_number)
      end
    @trains << train
    train
  end

  def add_train(train_number, train_type)
    train = find_train(train_number, train_type)
    return train if train

    create_train(train_number, train_type)
  end
end