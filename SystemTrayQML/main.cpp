#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
  /// モニタのピクセル解像度に基づいた自動スケーリング設定
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  /*!
   * 自動的にQMLにてルートウィンドウを作成しないように
   * 単一のQMLファイルからアプリケーションをロード
   */
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
