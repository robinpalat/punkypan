
#include "MainWindow.h"
#include "ui_MainWindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow), logic(new Logic(this)) {
    ui->setupUi(this);

    connect(ui->calcularButton, &QPushButton::clicked, this, [=]() {
        double material1 = ui->lineEdit1->text().toDouble();
        double material2 = ui->lineEdit2->text().toDouble();
        double material3 = ui->lineEdit3->text().toDouble();
        double material4 = ui->lineEdit4->text().toDouble();
        logic->calcularGanancia(material1, material2, material3, material4);
    });

    connect(logic, &Logic::resultadoListo, this, [=](const QString &resultado) {
        ui->resultadoLabel->setText("Resultado: " + resultado);
    });
}

MainWindow::~MainWindow() {
    delete ui;
    delete logic;
}
