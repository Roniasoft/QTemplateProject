import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QTemplateProject

/*! ***********************************************************************************************
 * RIGIconTextButton provides a standard button with icon and text.
 * ************************************************************************************************/
RoniaBaseButton {
    id: button

    /* Property Declarations
     * ****************************************************************************************/
    property color  hoverColor:     Qt.darker(backColor, 1.03)
    property int    text_spacing:   5
    property string iconCode:       ""

    /* Object Properties
     * ****************************************************************************************/
    //! \todo replace opacity by saturation
    backgroundItem.opacity: enabled ? 1 : 0.4
    textColor:      "white"
    backColor:      "darkblue"
    borderColor:    backColor == "transparent" ? "lightblue" :
                                                                         Qt.darker(backColor)
    borderWidth:    1
    radius:         3
    font.pixelSize: height * 0.4

    /* Children
     * ****************************************************************************************/
    contentItem: Item {
        id: item

        // Icon
        RoniaTextIcon {
            id: icon

            anchors.left: parent.left
            anchors.leftMargin: (parent.width - text_spacing - width - buttonLabel.width) / 2
            anchors.verticalCenter: parent.verticalCenter

            width: height
            height: parent.height * 0.8

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            font.pixelSize: button.font.pixelSize * 1.5

            color: textColor            
            text: iconCode
        }

        // Button Text
        Text {
            id: buttonLabel;

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: icon.right
            anchors.leftMargin: text_spacing

            width: parent.width * 0.5
            height: parent.height * 0.8

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            font.pixelSize: button.font.pixelSize
            font.bold: button.font.bold

            color: textColor
            text: button.text
        }
    }
}
