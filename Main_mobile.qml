import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
    color: "#fbf9f5"
    flags: Qt.Window
    contentOrientation: Qt.PortraitOrientation
    title: qsTr("Punkypan")


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

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 9

        TextField {
            id: harinaInput
            color: "#f60a0a0a"
            selectionColor: "#f60a0a0a"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.rightMargin: 15
            Layout.leftMargin: 15
            Layout.bottomMargin: 5
            Layout.topMargin: 5
            Layout.fillWidth: true
            placeholderText: qsTr("Harina (kg)")
        }

        TextField {
            id: levaduraInput
            color: "#ef000000"
            selectionColor: "#f60a0a0a"
            font.preferShaping: false
            Layout.rightMargin: 15
            Layout.bottomMargin: 5
            Layout.leftMargin: 15
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            placeholderText: qsTr("Levadura (g)")
        }



        TextField {
            id: gasInput
            selectionColor: "#f60a0a0a"
            Layout.rightMargin: 15
            Layout.bottomMargin: 5
            Layout.leftMargin: 15
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            placeholderText: qsTr("Gas (min)")
        }



        TextField {
            id: panesInput
            selectionColor: "#f60a0a0a"
            Layout.rightMargin: 15
            Layout.bottomMargin: 5
            Layout.leftMargin: 15
            Layout.topMargin: 5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            placeholderText: qsTr("Pan producido (kg)")
        }


        Button {
            id: calcButton
            text: qsTr("Calcular")
            Layout.rightMargin: 15
            Layout.leftMargin: 15
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            flat: false
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 13
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


        TextArea {
            id: resultText
            anchors.verticalCenter: harinaInput.verticalCenter
            anchors.left: harinaInput.right
            anchors.right: harinaInput.left
            anchors.top: harinaInput.bottom
            anchors.bottom: harinaInput.top
            anchors.leftMargin: -1331
            anchors.rightMargin: -1331
            anchors.topMargin: 280
            anchors.bottomMargin: -687
            anchors.horizontalCenter: harinaInput.horizontalCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            placeholderText: qsTr("")
        }

        Row {
            id: row
            width: 200
            height: 400

            Button {
                id: button
                text: qsTr("Configurar")
                font.pointSize: 14
                onClicked: configDialog.open()
            }
        }


    }


    // Cuadro de diálogo de configuración
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
