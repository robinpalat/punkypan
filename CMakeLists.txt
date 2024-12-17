cmake_minimum_required(VERSION 3.16)

project(Punkypan VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)


# Definir variable para seleccionar la plataforma de destino (desktop por defecto)
if(NOT DEFINED TARGET_PLATFORM)
    set(TARGET_PLATFORM "desktop")
endif()

# Validar la plataforma seleccionada y definir el archivo main.qml correspondiente
if(TARGET_PLATFORM STREQUAL "mobile")
    set(MAIN_QML_FILE "Main_mobile.qml")
elseif(TARGET_PLATFORM STREQUAL "desktop")
    set(MAIN_QML_FILE "Main_desktop.qml")
else()
    message(FATAL_ERROR "Plataforma desconocida. Usa 'mobile' o 'desktop'.")
endif()

# Copiar el archivo seleccionado al directorio de compilación
configure_file(${CMAKE_SOURCE_DIR}/${MAIN_QML_FILE} ${CMAKE_SOURCE_DIR}/Main.qml COPYONLY)


qt_add_executable(appPunkypan
    main.cpp
    logic.cpp
    resources.qrc
)

qt_add_qml_module(appPunkypan
    URI Punkypan
    VERSION 1.0
    QML_FILES
        Main_mobile.qml
        Main_desktop.qml
        Main.qml
        SOURCES logic.h logic.cpp
        RESOURCES android/AndroidManifest.xml android/build.gradle android/res/values/libs.xml android/res/xml/qtprovider_paths.xml android/gradle/wrapper/gradle-wrapper.jar android/gradle/wrapper/gradle-wrapper.properties android/gradle.properties android/gradlew android/gradlew.bat
)

qt_add_resources(resources resources.qrc)
target_sources(appPunkypan PRIVATE main.cpp ${resources})

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPunkypan PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPunkypan
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_sources(appPunkypan PRIVATE
    main.cpp
    logic.cpp
    resources.qrc
)
target_link_libraries(appPunkypan
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appPunkypan
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
