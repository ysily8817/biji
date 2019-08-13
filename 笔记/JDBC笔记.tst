一、添加JDBC到Eclipse
	1、在项目中新建“lib”文件夹，并copy，jdbc的jar包
	2、右键点击jar包，点击build进行加载

二、使用JDBC的基本步骤
	//1、注册驱动（加载驱动），版本4以后会自动加载驱动，所以不用写以下代码了
		方法一；DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		方法二：Class.forName("com.mysql.jdbc.Driver");
		
	//2、建立连接,参数一：协议+访问的数据库，参数二：用户名， 参数三：密码
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "root");

	//3、创建statement，跟数据库打交道，一定需要这个对象
		Statement st = con.createStatement();
	//4、执行查询
		ResultSet rs = st.executeQuery("select * from t_stu");
		while(rs.next()) {
			int id =rs.getInt("id");
			String name = rs.getString("name");
			int age = rs.getInt("age");
			
			System.out.println("id : " + id + " name : " + name + " age : " + age);
		}
	//5、释放资源
		rs.close();
		st.close();
		con.close();

三、防止驱动二次注册
   	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
   	Driver 这个类里面有静态代码块，一上来就执行了，所以等同于我们注册了两次驱动。 其实没这个必要的。
   	//静态代码块 ---> 类加载了，就执行。 java.sql.DriverManager.registerDriver(new Driver());
		最后形成以下代码即可。
		Class.forName("com.mysql.jdbc.Driver");	 //参数为Driver的全路径
		
四、读取配置文件jdbc.properties	，一般定义在工具类中，并定义在静态代码块中	
	创建一个属性配置对象
		Properties pro = new Properties();
	方法一：这种方式需要把配置文件放到工程下面
		InputStream in = new FileInputStream("jdbc.propertiess");
	方法二：使用类加载器，读取src下的配置文件，这种方式放到src下面
		InputStream in = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.propertiess");
	导入输入流。相当于pro对象和配置文件建立连接
		pro.load(in);
	读取属性
		driverClass = pro.getProperty("driverClass");
		url = pro.getProperty("url");
			
五、使用单元测试，测试代码
	1. 定义一个类， TestXXX , 里面定义方法 testXXX.
	2. 添加junit的支持。 
		右键工程 --- add Library --- Junit --- Junit4
	3. 在方法的上面加上注解 ， 其实就是一个标记。
		@Test
		public void testQuery() {
			...
		}
	4. 光标选中方法名字，然后右键执行单元测试。  或者是打开outline视图， 然后选择方法右键执行。			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			