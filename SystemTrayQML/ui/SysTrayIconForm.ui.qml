import QtQuick 2.11
import Qt.labs.platform 1.1

/*!
 * QML UI form
 */
SystemTrayIcon {
  id: root_

  property alias menu_item_qtchan: menu_item_qtchan_
  property alias menu_item_quit: menu_item_quit_

  /// [1-3] タスクトレイアイコンを表示させる
  visible: true

  /// [2-1] タスクトレイに表示するアイコン設定
  iconSource: "qrc:/QtChanBack.png"

  /// [1-1] メニューの設定
  menu: Menu {
    /// [1-2] "Qtちゃん"メニュー項目設定
    MenuItem {
      id: menu_item_qtchan_
      text: qsTr("Qtちゃん")
    }

    /// セパレーター
    MenuItem { separator: true }

    /// [1-2] "Quit"メニュー項目設定
    MenuItem {
        id: menu_item_quit_
        text: qsTr("&Quit")
    }
  }
}
