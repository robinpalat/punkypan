import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 600
    height: 500
    visible: true
    color: window.color
    flags: Qt.Window
    contentOrientation: Qt.PortraitOrientation
    title: qsTr("Punkypank")


    // Definir un objeto de configuración con un id explícito
    Item {
        id: configData

        property double harinaPrecio: 750
        property double mantecaPrecio: 800
        property double salPrecio: 400
        property double levaduraPrecio: 500
        property double gasPrecio: 1.7
        property double mantecaPorKg: 0.2
        property double salPorKg: 0.02
        property double consumoGas: 765
    }


    // Cuadro de diálogo de configuración

    RowLayout {
        id: rowLayout
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout1
            width: 100
            height: 100
            Layout.minimumWidth: 300
            Layout.fillWidth: false
            Layout.minimumHeight: 300

            Label {
                id: label
                color: "#dd2b2828"
                text: qsTr("Panes")
                font.bold: true
                Layout.fillWidth: true
                font.pointSize: 16
                leftPadding: 8
                topPadding: 8
            }

            TextArea {
                id: resultText
                Layout.topMargin: 8
                Layout.rightMargin: 8
                Layout.leftMargin: 8
                Layout.fillHeight: true
                Layout.fillWidth: true
                placeholderText: qsTr("Text Area")
            }


            Button {
                id: calcButton
                text: qsTr("Calcular")
                font.pixelSize: 12
                font.italic: false
                highlighted: true
                Layout.fillHeight: false
                bottomInset: 0
                layer.sourceRect.x: 0
                smooth: false
                topInset: 0
                Layout.minimumHeight: 30
                Layout.bottomMargin: 10
                Layout.topMargin: 5
                Layout.rightMargin: 40
                Layout.leftMargin: 40
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                flat: false
                font.weight: Font.Normal
                font.bold: false
                Layout.fillWidth: true


                onClicked: {
                    // Tomar los textos directamente de los TextFields
                    let harina = harinaInput.text || "0";
                    let levadura = levaduraInput.text || "0";
                    let gas = gasInput.text || "0";
                    let panProducido = panesInput.text || "0";

                    // Mostrar los valores ingresados en la consola para depuración
                    console.log("Valores ingresados (como texto):", harina, levadura, gas, panProducido);

                    // Invocar método C++ con valores como QString
                    resultText.text = logic.calcularGanancia(harina, levadura, gas, panProducido);
                }


            }


            RowLayout {
                id: rowLayout1
                width: 100
                height: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                Layout.fillHeight: false
                Layout.fillWidth: true

                Button {
                    id: button
                    height: 24
                    text: qsTr("Configurar")
                    Layout.fillWidth: true
                    highlighted: false
                    flat: false
                    layer.enabled: false
                    display: AbstractButton.TextOnly
                    clip: false
                    Layout.leftMargin: 8
                    Layout.topMargin: 0
                    Layout.bottomMargin: 8
                    font.pointSize: 11
                }

                Button {
                    id: button1
                    text: qsTr("Productos")
                    Layout.bottomMargin: 8
                    Layout.leftMargin: 8
                    Layout.fillWidth: true
                }
            }



        }

        ColumnLayout {
            id: columnLayout2
            width: 100
            height: 100
            Layout.rightMargin: 5
            Layout.topMargin: 8
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignRight | Qt.AlignTop

            TextField {
                id: harinaInput
                height: 80
                color: "#262626"
                font.letterSpacing: 1
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.rightMargin: 8
                Layout.leftMargin: 8
                Layout.bottomMargin: 0
                Layout.topMargin: 5
                Layout.fillWidth: true
                placeholderText: qsTr("Harina (kg)")
            }

            TextField {
                id: levaduraInput
                height: 80
                color: "#262626"
                font.letterSpacing: 1
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                font.preferShaping: false
                Layout.rightMargin: 8
                Layout.bottomMargin: 0
                Layout.leftMargin: 8
                Layout.topMargin: 5
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                placeholderText: qsTr("Levadura (g)")
            }

            TextField {
                id: gasInput
                height: 80
                color: "#262626"
                font.letterSpacing: 1
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.rightMargin: 8
                Layout.bottomMargin: 0
                Layout.leftMargin: 8
                Layout.topMargin: 5
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                placeholderText: qsTr("Gas (min)")
            }

            TextField {
                id: panesInput
                height: 80
                color: "#262626"
                font.letterSpacing: 1
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.rightMargin: 8
                Layout.bottomMargin: 0
                Layout.leftMargin: 8
                Layout.topMargin: 5
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                placeholderText: qsTr("Pan producido (kg)")
            }
        }
    }

    Dialog {
        id: configDialog
        title: "Configuración de Materiales"
        modal: true

        Column {
            spacing: 10

            TextField {
                id: harinaPrecioInput
                placeholderText: "Precio del kilo de harina"
                text: configData.harinaPrecio.toString()
            }
            TextField {
                id: mantecaPrecioInput
                placeholderText: "Precio del kilo de manteca"
                text: configData.mantecaPrecio.toString()
            }
            TextField {
                id: salPrecioInput
                placeholderText: "Precio del kilo de sal"
                text: configData.salPrecio.toString()
            }
            TextField {
                id: levaduraPrecioInput
                placeholderText: "Precio del kilo de levadura"
                text: configData.levaduraPrecio.toString()
            }
            TextField {
                id: gasPrecioInput
                placeholderText: "Precio del gas (por kg)"
                text: configData.gasPrecio.toString()
            }

            Button {
                text: "Guardar"
                onClicked: {
                    configData.harinaPrecio = parseFloat(harinaPrecioInput.text) || 750;
                    configData.mantecaPrecio = parseFloat(mantecaPrecioInput.text) || 800;
                    configData.salPrecio = parseFloat(salPrecioInput.text) || 400;
                    configData.levaduraPrecio = parseFloat(levaduraPrecioInput.text) || 500;
                    configData.gasPrecio = parseFloat(gasPrecioInput.text) || 1.7;

                    // Guardar la configuración en un archivo JSON
                    var config = {
                        harina: configData.harinaPrecio,
                        manteca: configData.mantecaPrecio,
                        sal: configData.salPrecio,
                        levadura: configData.levaduraPrecio,
                        gas: configData.gasPrecio,
                        mantecaPorKg: 0.2,
                        salPorKg: 0.02,
                        consumoGas: 765
                    };

                    var json = JSON.stringify(config);
                    var file = Qt.openResource("config.json", "w");
                    file.write(json);
                    file.close();

                    configDialog.close();
                }
            }

            Button {
                text: "Cancelar"
                onClicked: configDialog.close
            }
        }


    }







}
