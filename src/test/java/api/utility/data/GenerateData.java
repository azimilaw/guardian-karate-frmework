package api.utility.data;

public class GenerateData {
	
	public static String getEmail() {
		String prefix = "Auto_email";
		String provider = "@tekschool.u";
		
		int random = (int)(Math.random() * 10000);
		String email = prefix + random + provider;
		return email;
	}
	public static int getRandomId() {
		int random = (int)(Math.random() * 10000);
		return random;
	}
	public static int AccountDoesntexist() {
		int random = (int)(Math.random() * 1000000);
		return random;
	}
	public static int randomphonenumber() {
		int random = (int)(Math.random() * 100000000);
		int prefix=916;
		int phonenumber=prefix+random;
		
		return phonenumber;
	}
	public static void main(String[] args) {
		System.out.println(randomphonenumber());
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
