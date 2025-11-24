#ifndef QMLMQTTCLIENT_H
#define QMLMQTTCLIENT_H

#include <QtCore/QMap>
#include <QtMqtt/QMqttClient>
#include <QtMqtt/QMqttSubscription>

#include <QtQml/qqml.h>

class QmlMqttClient : public QObject {
    Q_OBJECT

    Q_PROPERTY(
        QString hostname READ hostname WRITE setHostname NOTIFY hostnameChanged)
    Q_PROPERTY(int port READ port WRITE setPort NOTIFY portChanged)
    Q_PROPERTY(QMqttClient::ClientState state READ state NOTIFY stateChanged)
    Q_PROPERTY(
        QString clientId READ clientId WRITE setClientId NOTIFY clientIdChanged)

    QML_NAMED_ELEMENT(MqttClient)
    QML_EXTENDED_NAMESPACE(QMqttClient)
  public:
    QmlMqttClient(QObject *parent = nullptr);

    Q_INVOKABLE void connectToHost();
    Q_INVOKABLE void disconnectFromHost();
    Q_INVOKABLE int publish(const QString &topic, const QString &message,
                            int qos = 0, bool retain = false);

    const QString hostname() const;
    void setHostname(const QString &newHostname);

    const QString clientId() const;
    void setClientId(const QString &newClientId);

    int port() const;
    void setPort(int newPort);

    QMqttClient::ClientState state() const;

  signals:
    void hostnameChanged();
    void portChanged();
    void stateChanged();
    void clientIdChanged();

  private:
    Q_DISABLE_COPY(QmlMqttClient)
    QMqttClient m_client;
    QString m_clientId;
};

#endif // QMLMQTTCLIENT_H
