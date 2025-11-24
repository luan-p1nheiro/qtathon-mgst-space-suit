#include "qmlmqttclient.h"
#include <QDebug>
#include <QJsonObject>
#include <QMqttTopicName>
#include <qtmetamacros.h>

QmlMqttClient::QmlMqttClient(QObject *parent) : QObject(parent) {
    connect(&m_client, &QMqttClient::hostnameChanged, this,
            &QmlMqttClient::hostnameChanged);
    connect(&m_client, &QMqttClient::portChanged, this,
            &QmlMqttClient::portChanged);
    connect(&m_client, &QMqttClient::stateChanged, this,
            &QmlMqttClient::stateChanged);
    connect(&m_client, &QMqttClient::messageReceived, this,
            &QmlMqttClient::onMessageReceived);
}

void QmlMqttClient::connectToHost() { m_client.connectToHost(); }

void QmlMqttClient::disconnectFromHost() { m_client.disconnectFromHost(); }

const QString QmlMqttClient::hostname() const { return m_client.hostname(); }

void QmlMqttClient::setHostname(const QString &newHostname) {
    m_client.setHostname(newHostname);
}

const QString QmlMqttClient::clientId() const { return m_clientId; }

void QmlMqttClient::setClientId(const QString &newClientId) {
    unsubscribe(m_clientId);
    m_clientId = newClientId;
    subscribe(m_clientId);
}

int QmlMqttClient::port() const { return m_client.port(); }

void QmlMqttClient::setPort(int newPort) {
    m_client.setPort(static_cast<quint16>(newPort));
}

QMqttClient::ClientState QmlMqttClient::state() const {
    return m_client.state();
}

QMqttSubscription *QmlMqttClient::subscribe(const QString &topic, quint8 qos) {
    if (m_client.state() != QMqttClient::Connected) {
        return nullptr;
    }

    QMqttSubscription *subscription =
        m_client.subscribe(QMqttTopicFilter(topic), qos);
    if (subscription) {
        m_subscriptions.insert(topic, subscription);
    }

    return subscription;
}

void QmlMqttClient::unsubscribe(const QString &topic) {
    if (m_subscriptions.contains(topic)) {
        QMqttSubscription *subscription = m_subscriptions.take(topic);
        if (subscription) {
            subscription->disconnect(this);
            subscription->unsubscribe();
        }
    }
}

void QmlMqttClient::onMessageReceived(const QByteArray &message,
                                      const QMqttTopicName &topic) {
    const QString messageData = QString::fromUtf8(message);

    if (topic.name().contains("/o2gauge")) {
        emit o2GaugeMessageReceived(messageData);
    }
    else if (topic.name().contains("/co2gauge")) {
        emit co2GaugeMessageReceived(messageData);
    }
    else if (topic.name().contains("/suittemperature")) {
        emit suitTemperatureMessageReceived(messageData);
    }
    else if (topic.name().contains("/externaltemperature")) {
        emit externalTemperatureMessageReceived(messageData);
    }
    else if (topic.name().contains("/powercell")) {
        emit powerCellMessageReceived(messageData);
    }
    else if (topic.name().contains("/mission/name")) {
        emit missionMessageReceived(messageData);
    }
    else if (topic.name().contains("/mission/nexttask")) {
        emit nextTaskMessageReceived(messageData);
    }
}
