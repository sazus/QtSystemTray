#ifndef TRAYWIDGET_H
#define TRAYWIDGET_H

#include <QSystemTrayIcon>

class QWidget;
class QMenu;
class QAction;

/*!
 * \brief QSystemTrayIconを継承した簡易Widgetクラス
 */
class TrayWidget : public QSystemTrayIcon {
 Q_OBJECT
 public:
  explicit TrayWidget(QWidget *parent = Q_NULLPTR);

 private:
  QMenu *menu_;           ///< SystemTray用のmenu
  QAction *action_quit_;  ///< quitメニュー
  QAction *action_qt_;    ///< Qtちゃんメニュー

 public Q_SLOTS:
  /*!
   * \brief デスクトップ通知メッセージ
   */
  void Message();
};

#endif // TRAYWIDGET_H
