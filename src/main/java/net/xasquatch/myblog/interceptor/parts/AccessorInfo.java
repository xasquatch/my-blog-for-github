package net.xasquatch.myblog.interceptor.parts;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

@Component
public class AccessorInfo {

    public String getIpAddress(HttpServletRequest request) {

        String ip = null;
        try {

            boolean isLoopBack = true;
            Enumeration<NetworkInterface> en;
            en = NetworkInterface.getNetworkInterfaces();

            while (en.hasMoreElements()) {
                NetworkInterface ni = en.nextElement();
                if (ni.isLoopback())
                    continue;

                Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    InetAddress ia = inetAddresses.nextElement();
                    if (ia.getHostAddress() != null && ia.getHostAddress().contains(".")) {
                        ip = ia.getHostAddress();
                        isLoopBack = false;
                        break;
                    }
                }
                if (!isLoopBack)
                    break;
            }
        } catch (SocketException e) {
            e.printStackTrace();
        }

        return ip;
    }

}
