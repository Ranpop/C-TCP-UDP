#include "socketthread.h"

SocketThread* SocketThread::m_pInstacne = NULL;

SocketThread::SocketThread(QObject *parent) : QThread(parent)
{
    bStop = false;
    m_tcpInstance = new QTcpSocket();

    QString host = "192.168.1.112";
    int port_int = 2010;

    m_tcpInstance->connectToHost((host), port_int);

    if (!m_tcpInstance->waitForConnected(10)){
        m_tcpInstance->disconnectFromHost();
    }

    //connect(m_tcpInstance, SIGNAL(error(int)), this, SLOT(errMsg(int)) );
    //ßconnect(m_tcpInstance, SIGNAL(readyRead()), this, SLOT(recvMsg()) );
}

SocketThread::~SocketThread()
{

}

SocketThread* SocketThread::GetInstance()
{
    if (NULL == m_pInstacne){
        m_pInstacne = new SocketThread();
    }

    return m_pInstacne;
}

void SocketThread::stop()
{
    bStop = true;
}

static QString res;
void SocketThread::run()
{
    static QString outstring = "This is a good test, please have a lunch now Baby!";
    while(!bStop){
        m_tcpInstance->connectToHost("192.168.1.112", 2010);
        if (!m_tcpInstance->waitForConnected(10)){
            m_tcpInstance->disconnectFromHost();
        }

        QTextStream out(m_tcpInstance);
        out <<outstring<<endl;
        qDebug("Send data");

        while(m_tcpInstance->waitForReadyRead())
        {
            //outstring += m_tcpInstance->readAll();
            m_tcpInstance->disconnectFromHost();
        }

        QThread::msleep(3000);
    }
}

void SocketThread::recvMsg()
{

}
void SocketThread::errMsg( int errNo)
{
    qWarning( "this is err!!!!" );
}

