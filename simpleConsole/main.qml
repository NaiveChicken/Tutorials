import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

import "logic.js" as Logic


ApplicationWindow {
    id: root

    visible: true
    width: 640
    height: 480
    title: qsTr("console")

    function jsCall(exp) {
        input.text = "";
        let data = Logic.executeCmd(exp);
        outputModel.insert(0, data);
    }

    ColumnLayout {
        anchors.fill: parent
 //       margins: 10

        RowLayout {
            Layout.fillWidth: true
            TextField {
                id: input
                Layout.fillWidth: true
                focus: true
                onAccepted: {
                    root.jsCall(input.text)
                }
            }

            Button {
                text: qsTr("Send")
                onClicked: {
                    root.jsCall(input.text)
                }
            }
        }
        Item {
              Layout.fillWidth: true
              Layout.fillHeight: true
              Rectangle {
                  anchors.fill: parent
                  color: '#333'
                  border.color: Qt.darker(color)
                  opacity: 0.2
                  radius: 2
              }

              ScrollView {
                  id: scrollView
                  anchors.fill: parent
                  anchors.margins: 9
                  ListView {
                      id: resultView
                      model: ListModel {
                          id: outputModel
                      }
                      delegate: ColumnLayout {
                          width: ListView.view.width
                          Label {
                              Layout.fillWidth: true
                              color: 'green'
                              text: "> " + model.expression
                          }
                          Label {
                              Layout.fillWidth: true
                              color: 'blue'
                              text: "" + model.result
                          }
                          Rectangle {
                              height: 1
                              Layout.fillWidth: true
                              color: '#333'
                              opacity: 0.2
                          }
                      }
                  }
              }
          }
    }
}
