# Текстовый интерфейс позволяет пользователю делать следующее:
# Создавать станции
# Создавать поезда
# Создавать маршруты и управлять станциями в нем (добавлять, удалять)
# Назначать маршрут поезду
# Добавлять вагоны к поезду
# Отцеплять вагоны от поезда
# Перемещать поезд по маршруту вперед и назад
# Просматривать список станций и список поездов на станции

require "./rail_road"

actions = [
  "1 - станции",
  "2 - маршруты",
  "3 - поезда",
  "0 - выход из программы"
]
stations_actions = [
  "1 - показать список всех станций",
  "2 - создать станцию",
  "(любой другой номер) - отмена",
]
routes_actions = [
  "1 - показать список маршрутов",
  "2 - создать маршрут",
  "3 - добавить станцию в маршрут",
  "4 - удалить станцию из маршрута",
  "5 - переместить поезд по маршруту вперед",
  "6 - переместить поезд по маршруту назад",
  "(любой другой номер) - отмена",
]
trains_actions = [
  "1 - показать список поездов",
  "2 - создать поезд",
  "3 - назначать маршрут поезду",
  "4 - добавлять вагоны к поезду",
  "5 - отцеплять вагоны от поезда",
  "(любой другой номер) - отмена",
]

rail_road = RailRoad.new

puts "Управление железной дорогой"

loop do
  puts "------------------"
  puts "Выберите действие:"
  puts actions
  action = gets.chomp.to_i

  case action
  when 0
    break 
  when 1 # stations
    puts "Выберите действие со станциями:"
    puts stations_actions
    station_action = gets.chomp.to_i
    case station_action
    when 1 # Просмотр списка станций
      puts "Список станций:" 
      rail_road.list_stations
    when 2 # Создать станцию
      puts "Добавление станции:" 
      print "Введите название станции: "
      station_name = gets.chomp
      if station_name
        rail_road.add_station(station_name)
        puts "Станция добавлена"
      else
        puts "Необходимо указать название станции"
      end
    end
    
    when 2 # routes
    puts "Выберите действие с маршрутами:"
    puts routes_actions
    route_action = gets.chomp.to_i
        case route_action
    when 1 # Просмотр списка маршрутов
      puts "Список маршрутов:"
      rail_road.list_routes
    when 2 # Создать маршрут
      puts "Добавление маршрута: "
      print "Введите название маршрута: "
      route_name = gets.chomp
      print "Введите название начальной станции: "
      station1_name = gets.chomp
      print "Введите название конечной станции: "
      station2_name = gets.chomp
      if route_name && station1_name && station2_name
        station1 = rail_road.add_station(station1_name)
        station2 = rail_road.add_station(station2_name)
        rail_road.add_route(route_name, station1, station2)
        puts "Маршрут создан"
      else
        puts "Необходимо указать все названия"
      end  
    when 3 # Добавить станцию в маршрут
      puts "Добавление станции в маршрут:"
      print "Введите название станции которую нужно добавить: "
      new_station_name = gets.chomp
      if new_station_name
        rail_road.add_station(new_station_name)
        puts "Станция #{new_station_name} добавлена в маршрут"
      else 
        puts "Необходимо ввести название станции которую нужно добавить"
      end
    when 4 # Удалить станцию из мрашрута
      puts "Удаление станции из маршрута:"
      print "Введите название станции, которую нужно удалить: "
      delete_station_name = gets.chomp
      if delete_station_name
        route.delete_station(delete_station_name)
        puts "Станция #{delete_station_name} удалена из маршрута"
      else 
        puts "Необходимо ввести название станции, которую нужно удалить"
      end
    when 5 # Перемещение поезда по маршруту вперед
      puts "Перемещение поезда по маршруту вперед:"
      print "Для перемещения вперед введите Forward: "
      forward = gets.chomp
      if forward
        rail_road.move_forward(forward)
        puts "Перемещение вперед"
      else
        "Для движения вперед необходимо ввести Forward"
      end
    when 6 # Перемещение поезда по маршруту назад
      puts "Перемещение поезда по маршруту назад"
      print "Для перемещения поезда назад введите Backward: "
      backward = gets.chomp
      if backward
        rail_road.move_backward(backward)
        puts "Перемещение назад"
      else
        puts "Для перемещения назад необходимо ввести Backward"
      end
    end

    when 3 # trains
    puts "Выберите действие с поездами:"
    puts trains_actions
    train_action = gets.chomp.to_i
    case train_action
    when 1 # Просмотр списка поездов на станции
      puts "Список поездов:"
      puts rail_road.list_trains(train_number, train_type)
  end
    when 2 # Создать поезд
      puts "Добавление поезда:"
      print "Введите номер поезда: "
      train_number = gets.chomp.to_i
      print "Введите тип поезда (грузовой или пассажирский): "
      train_type = gets.chomp
      if train_number && train_type
        rail_road.add_train(train_number, train_type)
        puts "Поезд добавлен"
      else
        puts "Необходимо указать номер и тип поезда"
      end
    when 3 # Назначать маршрут поезду
      puts "Назначение маршрута поезду: "
      print "Введите название маршрута: "
      route_name = gets.chomp
      if route_name
        rail_road.assign_route(route_name)
        puts "Поезду назначен маршрут #{route_name}"
      else
        puts "Необходимо указать название маршрута"
      end
    when 4 # Добавлять вагоны к поезду
      puts "Добавление вагонов к поезду: "
      print "Если вы хотите добавить вагон необходимо ввести Add"
      car_add = gets.chomp
      if car_add 
        rail_road.add_car(car_add)
        puts "Вагон добавлен"
      else
        "Необходимо ввести Add"
      end
    when 5 # Отцеплять вагоны от поезда
      puts "Отцепление вагона от поезда:"
      print "Если вы хотите хотите отцепить вагон от поезда введите Remove: "
      car_remove = gets.chomp
      if car_remove 
        rail_road.remove_car(car_remove)
        puts "Вагон отцеплен"
      else
        puts "Необходимо ввести Remove"
      end
    end
  end
end