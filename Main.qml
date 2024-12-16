import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import QtQuick.Window 2.15


Window {
    id: window
    width: 500
    height: 500
    visible: true
    color: window.color
    maximumHeight: 500
    maximumWidth: 500
    minimumHeight: 500
    minimumWidth: 500
    flags: Qt.Window
    visibility: Window.Windowed
    title: "Punkypan"
    contentOrientation: Qt.PortraitOrientation


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
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8

        ColumnLayout {
            id: columnLayout2
            Layout.rightMargin: 5
            Layout.topMargin: 8
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignRight | Qt.AlignTop

            Label {
                id: label
                color: "#dd2b2828"
                text: qsTr("Panes")
                anchors.left: resultText.right
                anchors.top: resultText.bottom
                anchors.fill: parent
                Layout.bottomMargin: 4
                Layout.fillWidth: true
                font.bold: true
                font.pointSize: 16
                leftPadding: 8
            }

            TextField {
                id: harinaInput
                color: "#afafaf"
                font.letterSpacing: 0
                hoverEnabled: true
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.rightMargin: 8
                Layout.leftMargin: 8
                Layout.bottomMargin: 0
                Layout.topMargin: 5
                Layout.fillWidth: true
                placeholderText: qsTr("Harina (kg)")
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: {
                    // permitir solo numeros y punto decimal
                    harinaInput.text = harinaInput.text.replace(/[^0-9.]/g, '');
                    // Permitir solo un punto decimal
                    if (harinaInput.text.indexOf('.') !== harinaInput.text.lastIndexOf('.')) {
                        harinaInput.text = harinaInput.text.slice(0, harinaInput.text.length - 1);
                    }
                }
            }


            TextField {
                id: levaduraInput
                color: "#afafaf"
                font.letterSpacing: 0
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
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: {
                    levaduraInput.text = levaduraInput.text.replace(/[^0-9.]/g, '');
                    if (levaduraInput.text.indexOf('.') !== levaduraInput.text.lastIndexOf('.')) {
                        levaduraInput.text = levaduraInput.text.slice(0, levaduraInput.text.length - 1);
                    }
                }
            }


            TextField {
                id: gasInput
                color: "#afafaf"
                font.letterSpacing: 0
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.rightMargin: 8
                Layout.bottomMargin: 0
                Layout.leftMargin: 8
                Layout.topMargin: 5
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                placeholderText: qsTr("Gas (min)")
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: {
                    gasInput.text = gasInput.text.replace(/[^0-9.]/g, '');
                    if (gasInput.text.indexOf('.') !== gasInput.text.lastIndexOf('.')) {
                        gasInput.text = gasInput.text.slice(0, gasInput.text.length - 1);
                    }
                }
            }


            TextField {
                id: panesInput
                color: "#afafaf"
                font.letterSpacing: 0
                Layout.minimumHeight: 30
                selectionColor: "#f60a0a0a"
                Layout.rightMargin: 8
                Layout.bottomMargin: 0
                Layout.leftMargin: 8
                Layout.topMargin: 5
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                placeholderText: qsTr("Pan producido (kg)")
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: {
                    panesInput.text = panesInput.text.replace(/[^0-9.]/g, '');
                    if (panesInput.text.indexOf('.') !== panesInput.text.lastIndexOf('.')) {
                        panesInput.text = panesInput.text.slice(0, panesInput.text.length - 1);
                    }
                }
            }

        }

        ColumnLayout {
            id: columnLayout1
            Layout.minimumWidth: 300
            Layout.fillWidth: false
            Layout.minimumHeight: 300

            Label {
                id: label1
                color: "#dd2b2828"
                text: qsTr("")
                anchors.verticalCenter: resultText.verticalCenter
                anchors.left: resultText.right
                anchors.right: resultText.left
                anchors.top: resultText.bottom
                anchors.bottom: resultText.top
                anchors.leftMargin: -292
                anchors.topMargin: -355
                topPadding: 8
                leftPadding: 8
                font.pointSize: 16
                font.bold: true
                anchors.horizontalCenter: resultText.horizontalCenter
                Layout.fillWidth: true
            }

            TextArea {
                id: resultText
                Layout.topMargin: 8
                Layout.rightMargin: 8
                Layout.leftMargin: 8
                Layout.fillHeight: true
                Layout.fillWidth: true
                text: ""
                readOnly: true
                wrapMode: TextEdit.WordWrap
                color: "black"
                font.pixelSize: 16
                background: Rectangle {
                    color: "white"
                    border.color: "#dbdbdb"
                }
            }



            Button {
                id: calcButton
                text: qsTr("Calcular")
                display: AbstractButton.TextBesideIcon
                font.italic: false
                highlighted: false
                Layout.fillHeight: false
                bottomInset: 0
                layer.sourceRect.x: 0
                smooth: false
                topInset: 0
                Layout.minimumHeight: 30
                Layout.bottomMargin: 10
                Layout.topMargin: 5
                Layout.rightMargin: 8
                Layout.leftMargin: 8
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                flat: false
                font.bold: false
                Layout.fillWidth: true


                onClicked: {
                    let harina = harinaInput.text || "0";
                    let levadura = levaduraInput.text || "0";
                    let gas = gasInput.text || "0";
                    let panProducido = panesInput.text || "0";

                    console.log("Valores ingresados:", harina, levadura, gas, panProducido);

                    let resultado = logic.calcularGanancia(harina, levadura, gas, panProducido);
                    console.log("Resultado de calcularGanancia:", resultado);

                    resultText.text = resultado;
                }

            }



            RowLayout {
                id: rowLayout1
                Layout.rightMargin: 8
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                Layout.fillHeight: false
                Layout.fillWidth: true


                Button {
                    id: buttonconfigDialog
                    text: qsTr("Configurar")
                    Layout.fillWidth: true
                    Layout.leftMargin: 8
                    Layout.bottomMargin: 8
                    onClicked: configDialog.open()
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

    }

    Dialog {
        id: configDialog
        title: "Configuración de Materiales"
        modal: true
        width: 200
        height: 500

        Column {
            spacing: 20

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
