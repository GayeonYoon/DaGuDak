package kr.co.DaGuDak.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/racing/{loginId}")
public class WebSocketController {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static String clientListString = "";
	Map<String, String> clientMap = new HashMap<String, String>();
	// Map에서 키를 loginId로 value를 getId로

	@OnOpen // 클라이언트가 웹소켓에 들어오고 서버에 아무런 문제 없이 들어왔을때 실행하는 메소드입니다.
	public void onOpen(Session session, @PathParam("loginId") String loginId) throws IOException, EncodeException {
		if (loginId.equals("익명")) {
			clients.add(session);
			loginId += session.getId();
		} else if (!clientListString.contains(loginId)) {
			clients.add(session);
		} else if (clientListString.contains(loginId)) {
			clientMap.put(session.getId(), loginId + "[dupl]");
			session.getBasicRemote().sendText("[enter]이미 채팅에 참여 중입니다.");
			session.close();
			return;
		}
		clientMap.put(session.getId(), loginId);
		clientListString += loginId + "<br>"; // 여기에 a태그 필요 (추후 ip밴 추가할 예정)

		// 모두에게
		for (Session client : clients) {
			client.getBasicRemote().sendText("[clients]" + clientListString);
			client.getBasicRemote().sendText("[enter]<b>" + loginId + "</b>님이 입장하셨습니다.");
		}
	}

	@OnMessage // 클라이언트에게 메시지가 들어왔을 때, 실행되는 메소드입니다.
	public void onMessage(String message, Session session) throws IOException {
		synchronized (clients) {
			String loginId = clientMap.get(session.getId());
			if (message.contains("[rally]")) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
				return;

			} else if (message.contains("[timer]")) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
				return;
			} else if (message.contains("[hostGameEnd]")) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
				return;
			} else {
				String movemessage = "<div id='yourId'>" + loginId + "</div><div id='yourMessage'>" + message
						+ "</div>";
				for (Session client : clients) {
					// 자기 자신한테는 보내지 않음
					if (!client.equals(session)) {
						client.getBasicRemote().sendText("[message]" + movemessage);
					}
				}
			}
		}
	}

	@OnClose // 클라이언트와 웹소켓과의 연결이 끊기면 실행되는 메소드입니다.
	public void onClose(Session session) throws IOException {
		String loginId = clientMap.get(session.getId());
		if (loginId.contains("[dupl]")) {
			return;
		}
		clientListString = clientListString.replace(loginId + "<br>", "");
		clientMap.clear();
		clients.remove(session);
		for (Session client : clients) {
			client.getBasicRemote().sendText("[exit]<b>" + loginId + "</b>님이 퇴장하셨습니다.");
			client.getBasicRemote().sendText("[clients]" + clientListString);
		}
	}

	@OnError
	public void onError(Throwable t) {
		t.printStackTrace();
	}

}