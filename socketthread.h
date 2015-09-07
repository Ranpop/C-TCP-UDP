#ifndef SOCKETTHREAD_H
#define SOCKETTHREAD_H

#include <QThread>
#include <QObject>
#include <QTcpSocket>

class SocketThread : public QThread
{
    Q_OBJECT
    explicit SocketThread(QObject *parent = 0);
    static SocketThread* m_pInstacne;
public:
    ~SocketThread();
    static SocketThread* GetInstance();
    void stop();

public slots:
    void recvMsg();
    void errMsg(int);
protected:
    void run();

private:
    volatile bool bStop;
    QTcpSocket *m_tcpInstance;
};

#endif // SOCKETTHREAD_H

