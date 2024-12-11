#include "logic.h"

Logic::Logic(QObject *parent) : QObject(parent) {}

QString Logic::calcularGanancia(const QString &harina, const QString &levadura, const QString &gas, const QString &panProducido) {
    double precioHarina = 2.5; // Precio por kg
    double precioLevadura = 0.1; // Precio por gramo
    double precioGas = 0.05; // Precio por minuto
    double precioPan = 5.0; // Precio por kg de pan producido

    // Convertir las cadenas a números
    double harinaKg = harina.toDouble();
    double levaduraG = levadura.toDouble();
    double gasMin = gas.toDouble();
    double panKg = panProducido.toDouble();

    double costo = (harinaKg * precioHarina) + (levaduraG * precioLevadura) + (gasMin * precioGas);
    double ingreso = panKg * precioPan;
    double ganancia = ingreso - costo;

    return QString("Ganancia: $%1").arg(ganancia, 0, 'f', 2);
}
