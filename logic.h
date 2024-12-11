#ifndef LOGIC_H
#define LOGIC_H

#include <QObject>
#include <QString>

class Logic : public QObject
{
    Q_OBJECT

public:
    explicit Logic(QObject *parent = nullptr);

    // Declaración del método calcularGanancia
    QString calcularGanancia(const QString &harina, const QString &levadura, const QString &gas, const QString &panProducido);
};

#endif // LOGIC_H
