package com.ibm.controller;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;


@ServerEndpoint(value="/websocket/monitor/{sid}")
@Component
public class WebSocketController {
	
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static AtomicInteger onlineNum = new AtomicInteger();

    //concurrent包的线程安全Set，用来存放每个客户端对应的WebSocketServer对象。
    private static ConcurrentHashMap<String, Session> sessionPools = new ConcurrentHashMap<>();

    //发送消息
    public void sendMessage(Session session, String message) throws IOException {
        if(session != null){
            synchronized (session) {
//                System.out.println("发送数据：" + message);
                session.getBasicRemote().sendText(message);
            }
        }
    }
    //给指定用户发送信息
    public void sendInfo(String userName, String message){
        Session session = sessionPools.get(userName);
        try {
            sendMessage(session, message);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //建立连接成功调用
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "sid") String userName){
    	System.out.println("sessionId:" + session.getId());
    	if(userName.equals("stranger")){
    		userName = userName+session.getId();
    	}
        sessionPools.put(userName, session);
        addOnlineCount();
        System.out.println(userName + "加入webSocket！当前人数为" + onlineNum);
        try {
        	if(userName.contains("stranger")){
        		sendMessage(session, "请先登录后加入聊天！");
        	}
            for (Session sessions: sessionPools.values()) {
                try {
                	if(!userName.contains("stranger")){
                		sendMessage(sessions, "欢迎" + userName + "加入聊天室！");
                	}
                    sendMessage(sessions, "当前人数为:" + onlineNum);
                } catch(Exception e){
                    e.printStackTrace();
                    continue;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //收到客户端信息
    @OnMessage
    public void onMessage(Session session,String message,@PathParam(value = "sid") String userName) throws IOException{
    	
    	message = userName+ ":  " + message ;
    	
        for (Session session1: sessionPools.values()) {
            try {
                sendMessage(session1, message);
            } catch(Exception e){
                e.printStackTrace();
                continue;
            }
        }
    }
    
    //关闭连接时调用
    @OnClose
    public void onClose(@PathParam(value = "sid") String userName){
        sessionPools.remove(userName);
        subOnlineCount();
        for (Session session: sessionPools.values()) {
            try {
                sendMessage(session, userName+" 断开连接！当前人数为" + onlineNum);
            } catch(Exception e){
                e.printStackTrace();
                continue; 
            }
        }
    }

    //错误时调用
    @OnError
    public void onError(Session session, Throwable throwable){
        System.out.println("发生错误");
        throwable.printStackTrace();
    }

    public static void addOnlineCount(){
        onlineNum.incrementAndGet();
    }

    public static void subOnlineCount() {
        onlineNum.decrementAndGet();
    }
    
}
