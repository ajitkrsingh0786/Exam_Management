package helpingClasses;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class SessionFact {
	static SessionFactory sf;
	private static ServiceRegistry serviceRegistry;
	public static SessionFactory getssionFact()
	{
		Configuration cfg=new Configuration();
		cfg.configure("/resources/hibernate.cfg.xml");
		serviceRegistry = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();	
		
		sf=cfg.buildSessionFactory(serviceRegistry);
		System.out.println("build session registry----------");
		
		return sf;
	}
	

}
