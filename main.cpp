#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> // Incluye esta cabecera
#include <QIcon>  // Esto es necesario para usar QIcon
#include "logic.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Establecer el icono de la ventana desde el archivo de recursos
    QIcon appIcon(":/resources/icon.png");  // Ruta del archivo en el archivo .qrc
    app.setWindowIcon(appIcon);


    // Crear una instancia de la clase Logic
    Logic logic;


    // Registrar la instancia como un contexto en QML
    engine.rootContext()->setContextProperty("logic", &logic);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Punkypank", "Main");

    return app.exec();
}
