import QtQuick 2.11
import Qt.labs.platform 1.1

/*!
 * QML execute 処理
 */
SysTrayIconForm {
  id: root_

  /// アイコンクリック時のアイコン表示トグル動作用フラグ
  property bool isQtChanBack: false

  /// [A-1] "Qtちゃん"メニュートリガーイベント処理
  menu_item_qtchan.onTriggered: {
    /*!
     * \attention QMLでは、APIが未対応でユーザー側がIconを設定できない。
     *            デフォルトの
     *              SystemTrayIcon.Information - デフォルトの情報アイコン
     *              SystemTrayIcon.Warning     - デフォルトの警告アイコン
     *              SystemTrayIcon.Critical    - デフォルトのエラーアイコン
     *            のみ対応。ただし、
     *            SystemTrayIcon.NoIcon - アイコン無し については、対応していない。
     *
     * 調査元Code先
     * QML -> C++:
     *   https://github.com/qt/qtquickcontrols2/blob/5.11/src/imports/platform/qquickplatformsystemtrayicon.cpp
     * C++:
     *   qtbase/src/platformsupport/themes/genericunix/dbustray/qdbustrayicon.cpp
     */
    root_.showMessage(qsTr("ゆるキャラ"), qsTr("Qtちゃんだよ"),
                      SystemTrayIcon.Critical, 1000 /*msec*/)
  }

  /// [A-1] "Quit"メニュートリガーイベント処理
  menu_item_quit.onTriggered: {
    Qt.quit()
  }

  /// [D-1] タスクトレイアイコンダブルクリック処理
  onActivated: {
    /// [D-2] ダブルクリップ時のみ動作させる (linux gnomeでは未対応)
    if (reason === SystemTrayIcon.DoubleClick) {
      /// アイコン画像のトグル動作
      if (root_.isQtChanBack) {
        root_.iconSource = "qrc:/QtChanBack.png"
        root_.isQtChanBack = false
      } else {
        root_.iconSource = "qrc:/QtChan.png"
        root_.isQtChanBack = true
      }
    }
  }

}
