package mailtest;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("red41611873", "zzaenpmffboovulh");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
