#include "qmlmqttclient.h"
#include <QDebug>
#include <QJsonObject>
#include <QMqttTopicName>

QmlMqttClient::QmlMqttClient(QObject *parent) : QObject(parent) {
    connect(&m_client, &QMqttClient::hostnameChanged, this,
            &QmlMqttClient::hostnameChanged);
    connect(&m_client, &QMqttClient::portChanged, this,
            &QmlMqttClient::portChanged);
    connect(&m_client, &QMqttClient::stateChanged, this,
            &QmlMqttClient::stateChanged);
}

void QmlMqttClient::connectToHost() { m_client.connectToHost(); }

void QmlMqttClient::disconnectFromHost() { m_client.disconnectFromHost(); }

const QString QmlMqttClient::hostname() const { return m_client.hostname(); }

void QmlMqttClient::setHostname(const QString &newHostname) {
    m_client.setHostname(newHostname);
}

const QString QmlMqttClient::clientId() const { return m_clientId; }

void QmlMqttClient::setClientId(const QString &clientId) {
    m_clientId = clientId;
}

int QmlMqttClient::port() const { return m_client.port(); }

void QmlMqttClient::setPort(int newPort) {
    m_client.setPort(static_cast<quint16>(newPort));
}

QMqttClient::ClientState QmlMqttClient::state() const {
    return m_client.state();
}

int QmlMqttClient::publish(const QString &topic, const QString &message,
                           int qos, bool retain) {
    return m_client.publish(QMqttTopicName(topic),
                            message.toUtf8(), qos, retain);
}
