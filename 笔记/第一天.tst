一、反射：主要用于框架当中，首先完成类加载操作，然后解剖类里面的数据
	加载类的三种方式
	1、Class.forName("reflect.Person");
	2、new Person().getClass();
	3、Person.Class;
	
二、通过反射获取类中的构造方法
	Class class1 = Class.forName("reflect.Person");		//获取类对象，加载类到虚拟机中
	Constructor c = class1.getConstructor(String.class);//获取构造方法的对象
	c.setAccessible(true);	//如果构造方法是private修饰时，需要执行改语句
	Person person = (Person) c.newInstance("aaaaaaaaa");//通过构造方法的对象生成Person对象
	
三、通过反射调用普通方法
	public void aa(String name, int password)
	
	public void test5() throws Exception {
		Person p1 = new Person();	//创建person类的对象
		Class class1 = Class.forName("reflect.Person");
		Method method = class1.getMethod("aa", String.class, int.class);	//指定调用的方法，	
		method.invoke(p1, "zhangsan", 123456);	//指定调用那个对象，和方法的参数
		method.invoke(null, "zhangsan", 123456); //如果aa方法是静态方法，对象写为null，因为静态方法不需要对象调用
	}
	
