#include "traywidget.h"

#include <QMenu>
#include <QAction>
#include <QIcon>
#include <QApplication>

/*!
 * \brief コンストラクタ
 * \param parent 親QWidgetのポインタ
 */
TrayWidget::TrayWidget(QWidget *parent)
  : QSystemTrayIcon(parent)
  , menu_(new QMenu(parent))
  , action_quit_(new QAction(tr("&Quit"), parent))
  , action_qt_(new QAction(tr("Qtちゃん"), parent))
{
  /// [1-1] タスクトレイアイコン クリックメニュー登録
  menu_->addAction(action_qt_);
  menu_->addSeparator();
  menu_->addAction(action_quit_);

  /// [1-2] タスクトレイアイコン クリックメニュー設定
  setContextMenu(menu_);

  /// [2] 初期アイコン設定
  setIcon(QIcon(":/QtChanBack.png"));

  /// [3] タスクトレイに表示
  show();

  /*!
   * [1-3] メニュー各項目の動作シグナル/スロット接続
   */
  /// "Qtちゃん"メニューでメッセージ表示
  connect(action_qt_, &QAction::triggered, this, &TrayWidget::Message);
  /// "Quit"にて、タスクトレイアイコンアプリを閉じる
  connect(action_quit_, &QAction::triggered, qApp, &QApplication::quit);
  /// アイコン ダブルクリック時のメッセージ表示動作シグナル/スロット接続
  connect(this, &QSystemTrayIcon::activated,
          [this](QSystemTrayIcon::ActivationReason reason){
            if (reason == QSystemTrayIcon::DoubleClick) {
              Message();
            }
          }
  );
}


/*!
 * \brief デスクトップ通知メッセージ
 */
void TrayWidget::Message() {
  showMessage(tr("ゆるキャラ"), tr("Qtちゃんだよ"),
                    QIcon(":/QtChan.png"), 5000 /*msec*/);
}
