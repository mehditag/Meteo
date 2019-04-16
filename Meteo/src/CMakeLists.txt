qt5_add_resources(testquick_SRCS resources.qrc)
add_executable(meteo Objets.cpp capteur.c bme280.c main.cpp ${testquick_SRCS})
target_link_libraries(meteo Qt5::Qml Qt5::Gui)
