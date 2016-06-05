package eb.java.imall.login;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnlineUserCounter
 *
 */
@WebListener
public class OnlineUserCounter implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public OnlineUserCounter() {
        // TODO Auto-generated constructor stub
    }
    private static long onlineUsercount=0;
    public static long getonlineUsercount(){
    	return onlineUsercount;
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
  
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	OnlineUserCounter.onlineUsercount++;
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	OnlineUserCounter.onlineUsercount--;
    }
	
}
