package Controller;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/serverStart")
public class SokectServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    @OnOpen
    public void onOpen(Session session) {
        //���� ������ ������ �����ϴ� �޼ҵ�
    	System.out.println("Ŭ���̾�Ʈ ����");
        //���� ����� ����Ʈ�� ���� ���� ��û�� ���� ����ڸ� �߰��Ѵ�
        clients.add(session);
    }
    @OnMessage
    public void onMessage(String msg, Session session) throws IOException {
        //�����κ��� �����͸� ���۹��� ��� ������ �޼ҵ�
        System.out.println(msg);
        //�ϳ��� �� ó���� �����ϴµ��� ������� ������ �Ͼ�� �ȵȴ�.
        //�� NullPointer�� �����ϱ� ���� ����ȭ ó���� ���ش�.
        synchronized(clients) {
            for(Session client : clients) {
                client.getBasicRemote().sendText(msg);
            }
        }
    }
    @OnError
    public void onError(Throwable e) {
        //�����͸� �����ϴ� �������� ������ �߻��� ��� �����ϴ� �޼ҵ�
        e.printStackTrace();
    }
    @OnClose
    public void onClose(Session session) {
        //�������� ������ Set�� �̹� ���� ����ڰ� �����ֱ� ������ �޼��� ���۽� ���� ����.
        clients.remove(session);
    }
}
