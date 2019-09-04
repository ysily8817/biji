一、数组
常用方法说明

1、copy数组
公式：Arrays.copyOf(original, newLength);
说明：original:源数组，newLength:copy的长度
例：
	int[] a = new int[]{1, 3, 6, 22, 31, 4};
	int[] c = Arrays.copyOf(a, 10);
结果：打印数组c--》[1, 3, 6, 22, 31, 4, 0, 0, 0, 0]
如果源数组a长度不够，则补零;

2、copy数组
公式：Arrays.copyOfRange(original, from, to);
说明：original:源数组，from:从第几位开始，to：到第几位结束，结果为包含from位置，不包含to位置
例：
	int[] a = new int[]{1, 3, 6, 22, 31, 4};
	int[] b = Arrays.copyOfRange(a, 1, 4);
结果：打印数组b--》[3, 6, 22]

3、将数组转化为字符串
公式：Arrays.toString(a);
说明：直接将数组名作为参数传递，打印结果为:[1, 3, 6, 22, 31, 4]

4、将数组进行排序
公式：Arrays.sort(a);
说明：将数组a按升序排序

5、查找数组中元素出现的位置
公式：Arrays.binarySearch(a, key)；
说明：a为要查找的元素，key为要查找的元素，“进行查找前必须要进行sort排序！！！！！”
执行结果为元素key的角标

6、比较两个数组内容是否一致
公式：Arrays.equalse(int[] a, int[] b);
说明：比较数组a和数组b的内容是否一致

7、使用同一个值，填充整个数组
公式1：Arrays.fill(int[] a, 5);
公式2：Arrays.fill(a, fromIndex, toIndex, val);
说明：公式1，将数组a中的元素全部替换为5
说明：公式2，将数组a中fromIndex角标到toIndex之间的元素替换为val。

二、变长参数
公式：方法名(参数类型...参数名称){} 
说明：如果存在多个类型的形式参数，变长参数只能作为最后一个参数进行传递
	eg： public int sum(int... a) {   //参数就相当于一个数组，求和通过遍历数组
			int sum = 0;
			for(int i : a) {
				sum += i;
			}
	
三、多态
1、多态中的成员访问的特点：
	A:成员变量
		编译看左边，运行看左边
	B：构造方法
		创建子类对象的时候，访问父类的构造方法，对父类的数据进行初始化
	C：成员方法
		编译看左边，运行看右边
	D:静态方法
		编译看左边，运行看左边（静态和类香港，算不上重写，所以访问还是看左边）	

四、内部类
1、内部类概述
	把类定义在其他类的内部，这个类就被称为内部类，如下Inner就是Outer的内部类
		class Outer {
			class Inner {
			}
		}

2、内部类的访问特点
	A：内部类可以直接访问外部类的成员，包括私有
	B：外部类要访问内部类的成员，必须先创建内部类的对象

3、内部类的位置
	成员位置：在成员位置定义的类，被称为成员内部类
	局部位置：在局部位置定义的类，被称为局部内部类，比如将内部类定义在外部类的方法中

4、匿名内部类的定义格式
	接口名 对象名 = new 接口名() {
		//覆写抽象方法
	};
	
	MyInterface obj = new MyInterface() {
		@Override
		public void method() {
			System.out.print("匿名内部类实现了方法");
		}
	}
	
五、Eclipse常用配置
	A：程序的编译和运行环境的配置
		window -- Preferences -- Java
		编译环境：Compiler 默认选中的就是最高版本
		运行环境：Installed JREs默认会找到自己安装的JDK
		编译版本比运行版本低就可以运行

	B：字体大小及颜色
		a：Java代码区域的字体大小和颜色
			window -- Preferences -- General -- Appearance -- Colors And Fonts -- Java修改 -- Java Edit Text Font
		b：控制台
			window -- Preferences -- General -- Appearance -- Colors And Fonts -- Debug -- Console font
		c：其他文件
			window -- Preferences -- General -- Appearance -- Colors And Fonts -- Baseic -- Text Font


--------------------------------------常用类-----------------------------
六、Object类
	A：hashCode()  //返回对象的哈希码值，将该对象的内部地址转换为一个整数返回
	B：getClass()  //返回一个Class类型的变量， 可以调用Class类的getName()方法，获取当前类的类名
    C：toString()  //返回该对象的字符串表示，要重写该方法；打印对象名称时会自动调用toString()方法
	D：equals()    //默认比较引用地址的值，所以需要重新该方法。其中String中的equals()方法比较的是字符串内容是否相同
	E：“==”  //比较基本数据类型的值是否相等；比较引用时，比较的是地址值是否相同

七、Scanner类
	A：构造方法		//Scanner sc = new Scanner(System.in); 创建Scanner对象
	B：hasNextInt() //返回值类型为boolean，用于判断输入的数据是否为数字
	C：nextInt()	//获取一个Int类型的值，返回类型为Int
	D：nextLine()	//获取一个String类型的值，返回类型为String

八、String类
	A：构造方法：
		*public String()	//空构造
		*public String(byte[] bytes)	//把字节数组转化成字符串
		public String(byte[] bytes, int offset, int length)	//把字节数组的一部分转成字符串，offset指从某个位置开始
		*public String(char[] value)	//把字符数组转成字符串
		public String(char[] value, int offset, int length)	//把字符数组的一部分转成字符串
		public String(String original)	//把字符串常量值转化成字符串
		
	B：判断功能
		boolean equals(Object obj) //比较字符串内容是否相同，区分大小写
		boolean equalsIgnoreCase(String str) //比较字符串的内容是否相同，忽略大小写
		boolean contains(String str) //判断大字符串中是否包含小字符串
		boolean startWith(String str) //判断字符串是否以某个指定的字符串开头
		boolean endsWith(String str) //判断字符串是否以某个指定的字符串结尾
		boolean isEmpty() //判断字符串是否为空

	C:获取功能
		int length() //获取字符串的长度
		char charAt(int index) //获取指定索引位置的字符
		int indexOf(int ch) //返回指定字符在此字符串中第一次出现的索引
		int indexOf(String str) //返回指定字符串在此字符串中第一次出现的索引
		int indexOf(int ch, int fromIndex)	//返回指定字符在此字符串中从指定位置后第一次出现的索引
		int indexOf(String str, int fromIndex)	//返回指定字符串在此字符串中从指定位置后第一次出现的索引
		String substring(int start)	//从指定位置开始截取字符串，默认到末尾
		String substring(int start, int end) //从指定位置开始到指定位置结束截取字符串
		
	D：判断字符是大小写或者是数字
		a >= '0' && a <= '9'
		a >= 'a' && a <= 'z'
		a >= 'A' && a <= 'Z'
		//char类型的字符可以直接与数字和字母进行比较

	E:String转换功能
		byte[] getBytes() //把字符串转换为字节数组
		char[] toCharArray() //把字符串转换为字符数组
		static String valueOf(char[] chs) //把字符数组转成字符串
		static String valueOf(int i) //把int类型的数据转成字符串
			String类的valueOf方法可以把任意类型的数据转成字符串
		String toLowerCase() //把字符串转成小写
		String toUpperCase() //把字符串转成大写
		String concat(String str) //字符串拼接  str1.concat(str2) 等价于 str1 + str2

	F：String其他功能
		1、判断功能
			public boolean matches(String regex) //接收正则类型，用于判断字符串是否匹配该正则表达式
		2、String字符串替换
			String replaceAll(String regex, String replacement)	//全部替换
			String replaceFirst(String regex, String replacement)	//替换首个满足条件的内容
			eg：String str = "helloworld12321java123123213213haha";
				String regex = "\\d";
				String strNew = str.replaceAll(regex, "*");
				System.out.println(strNew);	//输出结果，用*号替代所有数字
		3、分割功能
			public String[] split(String regex);
			eg：String str = "18-24";    String[] age = str.split("-");
		4、获取功能,从str中获取与正则匹配的子字符串
			eg：String str = "da jia ting wo shuo, jin tian yao xia yu, bu shang wan zi xi, kai xin bu";
				String regex = "\\b[a-zA-Z]{3}\\b";
		
				Pattern p = Pattern.compile(regex);	//把规则编译成模式对象
				Matcher m = p.matcher(str);			//通过模式对象得到匹配对象
		
				while(m.find()) {
					System.out.println(m.group());
				}	//使用group()方法时，需要先调用find()方法进行判断，要不然会报错
				
九：StringBuffer类
	A：构造方法：
		public StringBuffer(); //无参构造，初始容量为16个字符
		public StringBuffer(int capacity); //指定容量的字符串缓冲区对象
		public StringBuffer(String str); //指定字符串内容的字符串缓冲区对象

	B：StringBuffer的普通方法
		public int capacity(); //返回当前容量，理论值，如水杯的容量为800L
		public int length();   //返回长度，实际值，如水杯内实际有300L水

	C、添加方法
		public StringBuffer append(String str); //可以把任意类型的数据添加到字符串缓冲区里，并返回字符串缓冲区本身
		public StringBuffer insert(int offset, String str); //在指定位置把任意类型的数据插入到字符串缓冲区里面
	
	D、删除功能
		public StringBuffer deleteCharAt(int index); //删除指定位置的字符，并返回本身
		public StringBuffer delete(int start, int end); //删除从指定位置开始指定位置结束的内容，并返回本身
		
	E、替换功能
		public StringBuffer replace(int start, int end, String str); //从start开始到end结束用str替换
		
	F、反转功能
		public StringBuffer reverse(); //abcd --> dcba
	
	G、截取功能
		public String substring(int start)
		public String substring(int start, int end); //注意返回类型为String

	H、String和StringBuffer相互转换
		String --> StringBuffer
		1、构造方法转换
			public StringBuffer(String str);
		2、普通方法转换
			public StringBuffer append(String str);
			
		StringBuffer --> String
		1、构造方法转换
			public String(StringBuffer sb);
		2、普通方法转换
			public String toString(); StringBuffer.toString();
	
	I、面试题
		1、String、StringBuffer、StringBuilder的区别
			String内容不可改变，而StringBuffer和StringBuilder内容都可变
			StringBuffer是同步的，数据安全，效率低；StringBuilder是不同步的，数据不安全，效率高
		2、StringBuffer和数组的区别
			二者都可以看做是一个容器，装其他数据
			但StringBuffer可以同时装多种类型，最终是一个字符串数据
			而数组可以放置多种数据，但必须是同一种数据类型
		3、形式参数
			基本类型：形式参数的改变不影响实际参数
			引用类型：形式参数的改变直接影响实际参数
			String作为参数传递，效果与基本类型作为参数传递一样。

十、基本类型
	A、Integer的构造方法
		public Integer(int value)	//将int类型的数字转换为Integer对象
		public Integer(String str)  //将字符串转换为Integer对象，其中字符串中的元素只能是数字
			
	B、将int转换为String
		int number = 100;
		方法一：
		String st = "" + number;
		方法二：（重点使用）
		String st = String.valueOf(number);
		方法三：
		Integer in = new Integer(number);
		String st = in.toString;
		方法四：
		String st = Integer.toString(number);
		
	C、将String转换为int
		String st = "100";
		方法一：
		Integer in = new Integer(st);
		int i = Integer.intValue(); 将Integer转换为int； //Integer in = Integer.valueOf(100); 将100转为Integer类型
										//自动拆装箱功能，可以使两者直接转换 Integer in = 100； in += 200;
										//Integer的直接赋值，如果在-128到127之间，会直接从缓冲池里获取数据 Integer in =100;
		方法二：(重点使用这种方法)
		int i = Integer.parseInt(st); //推荐使用 XX类型.parseXX(st) 把String类型转换为基本数据类型
		int i = Integer.parseInt(“123”，2)//将String转换为2进制，但不能转换为2进制，因为2进制由0和1组成，所以前后参数要一致
		
	D、10进制转换为其他进制（了解）
		Integer.toString(100, 16); //将100转换为16进制，进制范围是2-36，因为0-9，a-z共36个数字
			
十一、Math类：用于数学运算的类，			
	A、成员变量
		public static final double PI
		public static final double E
			
	B:成员方法、都是静态的
		public static int abs(int a); 绝对值
		public static double ceil(double a); 向上取整
		public static double floor(double a); 向下取整
		public static int(int a, int b); 最大值
		public static double pow(double a, double b); a的b次幂
		public static double random(); 随机数[0.0, 1.0)
		public static int round(float a) 四舍五入
		public static double sqrt(double a); 正平方根

十二、Random类：产生随机数的类；(生成随机数，一般使用Math类中random()方法)
	A、构造方法：
		public Random(); //没给种子，用的默认种子，是当前时间的毫秒值
		public Random(long seed); //给出指定的种子，给定种子后，每次生成的随机数都是相同的
	
	B、成员方法
		public int nextInt(); //返回的是int范围内的随机数
		public int nextInt(int n); //返回的是[0, n)范围内的随机数

十三、System类，包含一些有用的类字段和方法，不能被实例化
	方法：
		public static void gc(); //运行垃圾回收器
		public static void exit(int status); //终止当前正在运行的java虚拟机，参数作为状态码，非0表示异常退出
		public static long currentTimeMillis(); //返回以毫秒为单位的当前时间，如在代码开始和结束时调用该方法，以计算代码运行时间
		public static void arraycopy(Object src, int srcPos, Object dest, int destPos, int length)	
			
十四、BigInteger，位于java.math包下
	说明：Integer in = new Integer("11111111111");，当接收的字符串超出Integer最大值时，会报错
														此时选择BigInteger类型，该类下有多种数学计算方法
														
十五、BigDecimal，位于java.math包下，用于解决数学运算中出现的精度问题
	A、构造方法：
		public BigDecimal(String str)
	eg：System.out.println(0.01 + 0.09)  ==>输出结果是0.09999999999999999为解决这个问题，使用如下
		BigDecimal bd1 = new BigDecimal(0.01);
		BigDecimal bd2 = new BigDecimal(0.09);
		System.out.println(bd1 + bd2) ==>输出结果是0.01
	
十六、Date类
	A、构造方法：
		public Date();	//根据当前默认毫秒值创建日期对象
		public Date(long date); //根据给定的毫秒值创建日期对象，date单位是毫秒
	
	B、成员方法
		public long getTime(); //获取时间，以毫秒为单位
		public void setTime(long time); //设置时间
			
十七、DateFormat类：抽象类，位于java.text包下，日期转换中通常使用子类：SimpleDateFormat
		eg1：Date --》 String
		Date date = new Date();
		SimpleDateFormat sim = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String time = sim.format(date);
		System.out.println(time);
		
		eg2：String --> Date
		String time2 = "2018-06-05 18:20:20";
		//在把一个字符串解析为日期的时候，注意格式必须和给定的字符串格式匹配
		SimpleDateFormat sim2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date da = sim2.parse(time2);
		System.out.println(da);
	
十八、Calendar类，抽象类，位于java.util包下，用于操作日期
		Calendar cal = Calendar.getInstance();	//Calendar是一个抽象类，所以不能实例化对象，而是通过方法返回子类对象
		int year = cal.get(cal.YEAR);	//get方法中，传什么参数就能获取什么样的值
		int month = cal.get(cal.MONTH);
		int day = cal.get(cal.DATE);
		System.out.println(year + " " + (month + 1) + " " + day);
			
			
	B、成员方法
		public void add(int field, int amount); //根据给定的日历字段和对应的时间，来对当前的日历进行操作
		public final void set(int year, int month, int date); //设置当前日历的年月日
		eg：Calendar cal = Calendar.getInstance();	//获取当前的日历时间
		int year = c.get(cal.YEAR);
		c.add(Calendar.YEAR, -3) //三年前的今天
		c.set(2011, 11, 11)
		Date date = c.getTime()//通过日历对象把日历转换为日期对象
			
	集合--------------------------------------------------------
十九、Collection [kəˈlekʃn] 	
	A：添加功能
		boolean add(Object obj); //添加一个元素
		boolean addAll(Collection c); //添加一个集合的元素
	B：删除功能
		void clear(); //移除所有元素
		boolean remove(Object obj); //移除一个元素
		boolean removeAll(Collection c); //移除一个集合的元素,移除一个元素就返回true
	C：判断功能
		boolean contains(Object o); //判断集合中是否包含指定元素
		boolean containsAll(Collection c); //判断集合中是否包含指定的集合元素，必须包含所有的元素才返回true
		boolean isEmpty(); //判断集合是否为空
	D：获取功能
		Iterator<E> iterator() (重点)
	E：长度功能
		int size(); //获取元素个数
	F：交集功能
		boolean retainAll(Collection c); //两个集合都有的元素，没有交集也返回true，调用方法的集合变为[]；
											当调用该方法的集合发生变化时返回true，否则返回false；
		a集合["a","b","c"] b集合["e","d","f"] c集合["a","b","c","d"]
		结果：a.retainAll(b) //a变为[],返回true； a.retainAll(c) //a不变，返回false
	G：把集合转换成数组 
		Object[] toArray();
	H:把数组转成集合；使用Arrays类中的asList(T... t)方法，接收一个可变参数
		List<String> list = Arrays.asList("hello","world"); //可接收0个或多个参数
		注意：因为转换后list集合仍是数组，所以长度不可变，故使用删除和添加时报错
	I：遍历Iterator		
		Collection c = new ArrayList();
		Iterator i = c.Iterator();	
		while(i.hasNext()) {
			System.out.println(i.next());
		}

二十、List集合，List实现了Collection，下面是List特有功能
	特点：集合中的元素是有序、可重复的。
	A：添加功能
		void add(int index, Object element); //在指定位置添加元素
	B：获取功能
		Object get(int index); //获取指定位置的元素
	C：列表迭代器
		ListIterator listIterator(); //List集合特有的迭代器
	D：删除功能
		Object remove(int index); //根据索引删除元素，返回被删除的元素
	E：修改功能
		Object set(int index, Object element): //根据索引修改元素，返回被修改的元素。

练习：
//有一个集合，判断是否有world这个元素，如果有，就添加一个"javaee"元素
	list.add("java");	
	Iterator it = list.iterator();
	while(it.hasNext()) {
		String str = (String)it.next();
		if("world".equals(str)) {
			list.add("javaee");
		}
	//以上代码报错：java.util.ConcurrentModificationException
产生原因：
	迭代器是依赖于集合存在的，在判断成功后，集合中新添加了元素，而迭代器不知道，所以报错，这个错叫并发修改异常
	问题描述：使用迭代器遍历元素的时候，通过集合是不能修改元素的
解决方案
	A：使用迭代器迭代元素，迭代器添加元素，Iterator迭代器中没有添加方法，使用子类ListIterator
		新添加的元素跟在刚才判断的元素后面
	B：集合遍历元素，集合添加元素（通过for循环遍历）
		元素在最后添加


二十一、数据结构
	A：栈：特点，先进后出
	B：队列：特点，先进先出
	C：数组：特点，查询快，增删慢
	D：链表：特点，查询慢，增删快

二十二、List子类的特点
	ArrayList：
		底层数据结构是数组，查询快，增删慢
		线程不安全，效率高
	Vector
		底层数据结构是数组，查询快，增删慢
		线程安全，效率低
	LinkedList
		底层数据结构是链表，查询慢，增删快
		线程不安全，效率高

		
二十三、泛型：一般用于集合中，查看API文档，类和接口后面跟着<>就可以使用
	是一种把类型明确的工作推迟到创建对象或者调用方法的时候才去明确的特殊类型，参数化类型，把类型当做参数一样传递
	格式：ArrayList<String> list = new ArrayList<String>();
	好处：
		A：把运行时期的问题提前到了编译期间
		B：避免了强制类型转换
		C：优化了程序设计，解决了黄色警告线
	for(int i = 0; i < obj.length; i++) {
		Student s = (Student)obj[i]; //有了泛型可以修改为 Student s = obj[i],因为已经明确类型是Student了
		System.out.println(s.getName() + "----" + s.getAge());
	}	
			
二十四、泛型应用			
	A：泛型类
		格式：public class 类名<泛型类型...> ；如public class ObjectTool<T>
		注意：泛型类型必须是引用类型
	B：泛型方法
		格式：public <T> void show(T t); //可以接收任意类型，也就是t可以是任意类型的参数
	C：泛型接口		
		//第一种情况在实现的时候就确定是什么类型,很少用
	public class Inter implements InterImpl<String>{
		public void show(String str) {
			System.out.println(str);
		}
	}
	//第二种情况，在实现的时候不确定什么类型
	public class Inter<T> implements InterImpl<T>{
		@Override
		public void show(T t) {
			System.out.println(t);	
		}
	}	
	D：泛型高级(通配符)
		? :表示任意类型，如果没有明确，那么就是Object以及任意的java类
		? extends E:向下限定，E及其子类
		? super E:向上限定，E及其父类
		1、	//如果明确泛型的话，前后要保持一致
		Collection<String> co = new ArrayList<String>();
		Collection<String> co1 = new ArrayList<Integer>(); //报错	
		2、//?表示任意类型都可以
		Collection<?> co2 = new ArrayList<Object>();
		Collection<?> co3 = new ArrayList<Animal>();
		Collection<?> co4 = new ArrayList<Dog>();
		Collection<?> co5 = new ArrayList<Cat>();	
		3、//? extends E:向下限定，？代表E及其子类
		Collection<? extends Object> co6 = new ArrayList<Object>();
		Collection<? extends Animal> co7 = new ArrayList<Animal>();
		Collection<? extends Animal> co8 = new ArrayList<Dog>();
		Collection<? extends Animal> co9 = new ArrayList<Cat>();	
			
二十五、set集合(子类：HashSet、LinkedHashSet、TreeSet)
		特点：无序，不可重复；无序指的是存储和取出顺序不同
	A：子类HashSet跟hashCode和equal方法相关的类	
			存储字符串的时候，重复字符串只会存储一次，是 因为String类重新了hashCode和equal方法
			存储对象的时候，需要在该对象类中重新hashCode和equal方法，可以通过Eclipse自动生成
	B：子类LinkedHashSet
		特点：底层数据结构由哈希表和链表组成
		哈希表保证元素的唯一性
		链表保证元素有序，(存储和取出的顺序一致)
	C、子类TreeSet
		特点：能够对元素按照某种规则进行排序，元素唯一
			排序有两种方式
			1：(元素具有比较性)根据元素的自然顺序对元素进行排序(一个类要实现自然排序，就要实现自然排序的接口)
				真正的比较是依赖于元素的compareTo()方法，而这个方法是定义在Comparable里面的
				所以，要想重写该方法，就必须是先实现Comparable接口，这个接口表示的就是自然排序
			2：(集合具有比较性)或者根据创建set时提供的Comparator(比较器)进行排序，具体取决于使用的构造方法
				使用TreeSet(Collection<? extends E> c)构造方法排序时，要自己建一个类实现
					Comparator接口并重写compare()方法。
	D：TreeSet底层是二叉树结构
		1、元素的存储：第一个元素存储的时候，直接作为根节点存储
						从第二个元素开始，每个元素从根节点开始比较
							大了，放右边；小了放左边，相等不做处理
		2、元素的取出：从根节点开始，按照左中右的原则依次取出
			
二十六、针对Collection集合我们到底使用谁？
	唯一吗?
		是：set
			排序吗?
				是：TreeSet
				否：HashSet
		如果你知道是Set，但是不知道是哪个Set，就用HashSet
		
		否：List
			要安全吗？
				是：Vector
				否：ArrayList或者LinkedList
					查询多：ArrayList
					增删多：LinkedList
		如果你知道是List，但不知道是哪个List，那么就使用ArrayList
	如果你知道是Collection集合，但是不知道使用谁，就用ArrayList
	如果你知道用集合，就用ArrayList
			
二十七、Map集合(HashMap和TreeMap两个主要子类)
	A、	添加功能
		V put(K key, V value); 添加元素，
			如果键是第一次存储，就直接存储元素，返回null
			如果键不是第一次存储，就用值把以前的值替换掉，返回以前的值
		eg：//添加元素
		System.out.println(map.put("zhangsan", "lisi"));  //null
		System.out.println(map.put("zhangsan", "wangwu"));//lisi
		System.out.println(map.put("wanger", "xiaoyi"));  //null
	B、删除功能
		void clear();移除所有的键值对元素
		V remove(Object key); 根据键删除键对应的元素，并把键对应的值返回
		eg:System.out.println(map.remove("wanger")); //xiaoyi
	C、判断功能
		boolean containsKey(Object key); 判断集合是否包含指定的键
		boolean containsValue(object value); 判断集合是否包含指定的值
		boolean isEmpty(); 判断集合是否为空
	D、获取功能
		Set<Map.Entry<K,V>> entrySet();
		V get(Object key); 根据键获取值
			eg:System.out.println("get = " + map.get("wanger")); //返回xiaoyi
		Set<K> keySet(); 获取集合中所有键的集合
			eg:Set<String> set = map.keySet();
		Collection<V> values(); 获取集合中所有值的集合
			eg:Collection<String> coll = map.values();
	E、长度功能
		int size(); 返回集合中键值对的对数		

二十八、IO
	File类
	A、创建功能
		1、boolean createNewFile(); //创建文件，如果存在这个文件，就不创建了
		2、boolean mkdir();	//创建文件夹，如果存在了就不创建了
		3、boolean mkdirs(); //同时创建多层文件夹，如(E:aa\bb\cc)，如果存在就不创建
		使用方法如下：
			File file = new File("E:\\aaa\\bb"); //先创建File对象
			System.out.println(file.mkdirs());
	
	B、删除功能
		public boolean delete();
		1、如果创建文件对象时没有写路径，默认在项目路径下
		2、Java删除不走回收站
		3、要删除一个文件夹，文件夹内不能有文件或者文件夹，有的话要一层层删除。
	
	C、重命名
		public boolean renameTo(File dest)
		例：File file = new File("E:\\aaa");
			File newfile = new File("E:\\addddddddddddddddd");
			System.out.println(file.renameTo(newfile));
		如果file和newfile路径相同，就改名
		如果路径不同，就改名并剪切
	
	D、判断功能
		public boolean isDirectory();	//判断是否是目录
		public boolean isFile();		//判断是否是文件
		public boolean exists();		//判断是否是存在
		public boolean canRead();		//判断是否是可读
		public boolean CanWrite();		//判断是否是可写
		public boolean isHidden();		//判断是否是隐藏
		例：File file = new File("E:\\aaa");
			file.isDirectory;
	
	E、普通获取功能
		public String getAbsolutePath()	//获取绝对路径
		public String getPath()			//获取相对路径
		public String getName()			//获取名称
		public long length()			//获取长度（文件的大小，字节数）
		public long lastModified()		//获取最后一次的修改时间，以毫秒为单位
		把毫秒转换成当前时间
		Date d = new Date("毫秒值");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s = sdf.format(d);
	F、高级获取功能，获取指定目录下面所有的文件名
		public String[] list();	//获取指定目录下的所有文件或文件夹的名称数组
		public File[] listFiles();	//获取指定目录下的所有文件或文件夹的File数组
		
二十九、IO流分类
	A、按流向分
		1、输入流，读数据（相对于程序，如通过程序读取硬盘上的文件。）
		2、输出流，写数据
	B、按类型分（默认按类型分）
		1、字节流
			InputStream  //是所有字节输入流的超类（抽象类）
			OutputStream //是所有字节输出流的超类
		2、字符流
			Reader //是所有字符输入流的超类（抽象类）
			Writer //是所有字符输出流的超类
	
三十、OutputStream 字节输出流（写数据）
	A、构造方法
		1、FileOutputStream(File file) 
		2、FileOutputStream(String name) 
		3、FileOutputStream(File file, boolean append) //后面参数为true时，表示追加写入，即从文件的末尾写入
		4、FileOutputStream(String name, boolean append)  //不追加，表示从文件的开头写入
	
	B、字节输出流操作步骤
		1、创建字节输出流对象
			使用以上1、2两种构造方法
				a、 File file = new File("D:\\test\\1.txt");
					FileOutputStream fos = new FileOutputStream(file);
				b、 FileOutputStream fos = new FileOutputStream("D:\\test\\1.txt");
		2、写数据
				fos.write("hello".getBytes()); //write(byte[] b) write方法接收byte数组，需要把字符串转换成byte数组
		3、释放资源
				for.close();
				为什么一定要close()呢
					1、让流对象编程垃圾，这样就可以被垃圾回收器回收了
					2、通知系统去释放该文件相关的资源
	
三十一、InputStream 字节输入流（读数据）
	A、构造方法 
		1、FileInputStream(String name) 		
	B、字节输入流操作步骤
		1、创建字节输入流对象
				FileInputStream fis = new FileInputStream("D:\\test\\1.txt");
		2、读数据--》 int read();每次读一个字节，返回int类型，类似于迭代器中的next()方法。
			int a = 0;
			while((a = fipt.read()) != -1) { //-1，如果到达文件末尾，则返回-1
				System.out.print((char)a);
			}	
		3、释放资源
				for.close();		
			
	eg：//复制文本文件，从1.txt复制文件内容到2.txt；
		FileInputStream fipt = new FileInputStream("D:\\BaiduNetdiskDownload\\java视频\\day20\\day20\\1.txt");
		FileOutputStream fopt = new FileOutputStream("D:\\BaiduNetdiskDownload\\java视频\\day20\\day20\\2.txt");
		
		int a = 0;
		while((a = fipt.read()) != -1) {
			fopt.write(a);
		}	
	C：在计算机中中文的存储分为两个字节：
		第一个字节肯定是负数
		第二个字节场景的是负数，可能有正数，但是没影响
			
	//int read(byte[] byte) 一次读取一个字节数组, 返回值int表示实际读取的字节个数
		FileInputStream fis = new FileInputStream("1.txt");
		byte[] by = new byte[5];
		int len = 0;
		while((len = fis.read(by)) != -1) {
			System.out.print(new String(by, 0, len));
		}		
	//缓冲区读取数据，速度更快
	public static void method3(String srcFile, String deskFile) throws Exception {
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(srcFile));
		BufferedOutputStream bops = new BufferedOutputStream(new FileOutputStream(deskFile));
		int a = 0;
		while((a = bis.read()) != -1) {
			bops.write(a);
		}
		bis.close();
		bops.close();
	}
	
	public static void method4(String srcFile, String deskFile) throws Exception {
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(srcFile));
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(deskFile));
		byte[] by = new byte[1024];
		int len = 0;
		while((len = bis.read(by)) != -1) {
			bos.write(by, 0, len);
		}
		bis.close();
		bos.close();
	}	
		
三十二、OutputStreamWriter //字符输出流（又叫字符转换流），是Writer子类
	A、五种写数据的方法
		1、public void write(int c) //写一个字符
		2、public void write(char[] cbuf) //写一个字符数组
		3、public void write(char[], int off, int len) //写一个字符数组的一部分
		4、public void write(String str) //写一个字符串
		5、public void write(String str, int off, int len) //写一个字符串的一部分
		ps：写完数据之后必须执行，flush()或者close()方法，才能把数据成功写入文本文件
			因为，字符 = 2个字节， 文件中数据存储的基本单位是字节，所以FileOutputStream可以直接写入
			close()方法，关闭并刷新流

	B、两种读的方式，InputStreamReader();一次读一个字符和一次读一个字符数组
		InputStreamReader isr = new InputStreamReader(new FileInputStream("1.txt"));
		//方法一
		/*int len = 0;
		while((len = isr.read()) != -1) {
			System.out.print((char)len);
		}*/
		//方法二
		int len = 0; 
		char[] ch = new char[1024];
		while((len = isr.read(ch)) != -1) {
			System.out.print(new String(ch, 0, len));
		}
	*****因为以上两种字符转换流类名比较长，所以产生了两个子类FileReader和FileWriter*****

三十三、BufferedWirter和BufferedInput
	//两种创建对象的方式
		//BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("aa.txt")));
		BufferedWriter bw = new BufferedWriter(new FileWriter("a.txt"));

	B、字符缓冲流的特殊方法
		BufferedWriter
			public void newLine(); 根据系统来决定换行符，
		BufferReader
			public String readLine(); 一次读取一行数据
			包含该行内容的字符串，不包含任何行中支付，如果已经到达流末尾，则返回null
	例：
	public static void reader() throws Exception {
		BufferedReader br = new BufferedReader(new FileReader("999.txt"));
		String st = null;
		while((st = br.readLine()) != null) {
			System.out.println(st);
		}
		br.close();
	}
	
	public static void writer() throws Exception {
		BufferedWriter bw = new BufferedWriter(new FileWriter("999.txt"));
		for(int i = 0; i < 10; i++) {
			bw.write("hello" + i);
			bw.newLine(); //会根据不同的操作系统进行换行
			bw.flush(); //一般写、换行、缓冲一起操作
		}
		bw.close();
	}

	C、BufferedReader子类LineNumberReader有两个方法
		getLineNumber(); //获取行号
		setLineNumber(); //设置当前行号
		例：
		LineNumberReader lr = new LineNumberReader(new FileReader("student.txt"));
		String st = null;
		while((st = lr.readLine()) != null) {
			System.out.println(lr.getLineNumber() +  ":" + st);
		}
	
三十四、IO小结
字节流					           	字符流
	
	输入流                         		输入流  
	InputStream（抽象类）				Reader（抽象类）
		实际使用：							实际使用：
		FileInputStream						InputStreamReader（太长，使用子类FileReader）
		BufferedInputStream					BufferedReader //特殊方法 String readLint() 一次读取一行数据
		
	输出流								输出流
	OutputStream（抽象类）				Writer（抽象类）
		实际使用：						实际使用：
		FileOutputStream				OutputStreamWriter（太长，使用子类FileWriter）
		BufferedOutputStream			BufferedWriter //特殊方法 void newLine(); //写入换行符号
		
字节流复制数据：4种方式
字符流复制数据：5种方式，多了一个Buffered中的特殊方法

三十五、Thread
	注意：同一个Thread线程对象只能调用一次start()方法，再次调用报错IllegalThreadStateException，因为线程已经启动了，
			再次调用，表示又要启动一次，所以报错

	A、获取线程名称
		//方法一
		MyThread my1 = new MyThread(); //MyThread()自定义的线程类，继承Thread，重新run()方法，run方法的内容为多进程执行的代码
		my1.setName("aaa");		//调用setName方法，给线程指定名称
		my1.start();			//start的方法有两个作用，启动多线程，并调用run()方法
		//方法二
		MyThread my1 = new MyThread("aaa"); //使用构造方法指定进程名称，MyThread要定义一个接收name的构造方法
		my1.start();

		public MyThread(String name) {  //MyThread要定义一个接收name的构造方法
			super(name);
		}

	B、针对不是Thread子类如何获取线程对象的名称
	public static Thread currentThread(); //返回当前正在执行的线程对象
	如：System.out.println(Thread.currentThread().getName());  执行结果为main

	C、线程优先级的设置
		1、默认优先级是5
		   优先级范围是[1, 10]
		   优先级仅仅表示线程获取的CPU时间相对较高，并不是所优先级高的线程一定先执行完
		2、如何获取线程对象的优先级
			public final int getPriority(); 返回线程对象的优先级
		3、设置线程对象的优先级
			public final void setPriority(int newPriority); 更改线程的优先级
	
	D、线程控制
		1、线程休眠
			public static void sleep(long millis);
			使用方法: Thread.sleep(1000); 表示进程暂停1000毫秒
		2、等待线程结束
			public final void join();
			使用方法， 对象名.join(); 表示当该对象执行完之后，其他进程对象才开始执行
			并且该方法在start方法之后调用，因为只有启动了才可以结束
		3、暂停线程
			public static void yield()；暂停当前正在执行的线程对象，并执行其他进程
			在run()方法中调用               让多个进程执行的更加和谐，但不能保证一人执行一次	
		4、守护线程
			public final void setDaemon(boolean on)；将该线程标记为守护线程或用户线程
			当正在运行的线程都是守护线程时，java虚拟机退出，该方法必须在启动线程前调用
			如有三个线程，线程1、2设置为守护线程，当线程3执行完毕后，线程1、2也会结束，但不会立刻结束
		5、中断线程
			public void interrupt()； 中断线程，把线程的状态终止，并抛出InterruptibleChannel
			在启动线程之后执行
			
			public class ThreadStopTest001 {
				public static void main(String[] args) {
				StopThread stopThread = new StopThread();
				stopThread.start();
				//如果stopThread线程执行超过3秒，就关闭该线程，关闭该进程也会执行线程后面的代码
				try {
					Thread.sleep(3000);
					stopThread.interrupt();
				} catch (InterruptedException e) {
				e.printStackTrace();
					}
				}
			}

			class StopThread extends Thread {
				public void run() {
				System.out.println("线程启动" + new Date());
				try {
					Thread.sleep(10000);
				} catch (InterruptedException e) {
					System.out.println("线程终止");
				}
				System.out.println("线程结束" + new Date());
				}
			}
			执行结果：线程启动Sun Jul 08 18:45:56 CST 2018
					  线程终止
					  线程结束Sun Jul 08 18:45:59 CST 2018

	E:创建线程的第一种方式：继承Thread类
	步骤：
	a、定义类继承Thread
	b、复写Thread类中的run方法
	c、调用线程的start方法
		该方法有两个作用：启动线程，调用run方法。

	创建线程的第二中方式：实现Runnable接口
	步骤：
	a、定义MyRunnable类实现Runnable接口
	b、覆盖Runnable接口中的run方法
		将线程要运行的代码存放在该run方法中
	c、创建MyRunnable类的对象
	d、通过Thread类建立线程对象
	e、将Runnable接口的子类对象作为实际参数传递给Thread类的构造函数
		为什么要将Runnable接口的子类对象传递给Thread的构造函数
		因为，自定义的run方法所属的对象是Runnable接口的子类对象
		所以要让线程去指定对象的run方法。就必须明确该run方法所属对象。
	f、调用Thread类的start方法开启线程并调用Runnable接口子类的run方法
	public class ThreadRunnableTest {
		public static void main(String[] args) {
			ThreadRunnable tr = new ThreadRunnable();	
			Thread t1 = new Thread(tr);
			Thread t2 = new Thread(tr);
			t1.start();
			t2.start();
		}
	}

	class ThreadRunnable implements Runnable {
		public void run() {
			for(int i = 0; i < 500; i++) {
				System.out.println(Thread.currentThread().getName() + " " + i);
			}	
		}
	}

F、线程安全问题（卖票案例，会出现同票多卖，和负数票的问题）
	class SellTicker implements Runnable {
		private int ticker = 100;
		@Override
		public void run() {
			while(ticker > 0) {
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				System.out.println(Thread.currentThread().getName() + "正在出售第 ： " + ticker-- + "张票");
			}
		}
	}
		产生原因：	
			1、是否是多线程						是
			2、是否有共享数据					是
			3、是否存在多条语句操作共享数据		是
			（因为问题1和2改变不了，所以只能改变问题3，思路是：把多条语句操作共享数据的代码包成一个整体，
														让某个线程在执行的时候，别人不能执行）
		解决线程安全的方法一：java提供了：同步机制；  
		使用同步代码块解决，格式如下：
			synchronized(对象) {需要同步的代码；} //其中对象可以是任意对象
			private Object obj = new Object();
			@Override
			public void run() {
				synchronized(obj) {
					需要同步的代码；
				}
			}
	G、同步的特点
		同步的前提：
			必须要有两个或两个以上的线程
			必须是多个线程使用同一个锁

		好处：解决了多线程的安全问题

		弊端：多个线程需要判断锁，较为消耗资源	
			
	H、同步函数 ---synchronized修饰的函数为同步函数
	格式如下：
	public synchronized void add(int i)		
			
三十九、多线程（概念、理解）
	A、多线程：一个应用程序有多条执行路径
		进程：正在执行的应用程序
		线程：进程的执行单元，执行路径
		单线程：一个应用程序只有一条执行路径
		多线程：一个应用程序有多条执行路径
		
		多进程的意义？  
			提高CPU的使用率
		多线程的意义？
			提高应用程序的使用率
	B、Java程序的运行原理及JVM的启动是多线程的吗？
		1、Java命令去启动JVM，JVM会启动一个进程，该进程会启动一个主线程
		2、JVM的启动是多线程的，因为它最低有两个线程启动了，主线程和垃圾回收线程
		
四十、JDK5之后的Lock锁
	创建子类对象，Lock是接口。
	Lock lock = new ReentrantLock();
	//加锁
	lock.lock(); 
		需要加锁的代码
	//释放锁
	lock.unlock();

四十一、多个类同时使用同一对象，实现方法如下
	实现方法：在外界把这个对象创建出来，然后通过构造方法传递给其他的类
	Student ss = new Student();
		
	SetThread st = new SetThread(ss);
	GetThread gt = new GetThread(ss); //以上代码，使SetThread和GetThread类访问了同一个对象ss

四十二、网络编程
	A、网络编程的三要素
		1、IP地址
		2、端口（0-65535）
		3、协议
			UDP：
				把数据打包
				数据有限制，大小限制在64K
				不建立连接，不可靠
				速度快
			TCP：
				建立连接通道
				数据无限制
				速度慢，可靠
	
	B、public static InetAddress getByName(String host);根据主机名或IP地址的字符串获取地址对象
	   public String getHostAddress()；获取主机的IP
	   public String getHostName()；   获取主机的名称

	C、Socket编程，网络编程，又叫套接字编程
		Socket包含了：IP地址 + 端口号
		Socket原理机制：
			通信的两端都有Socket
			网络通信其实就是Socket间的同学
			数据在两个Socket间通过IO传输
			
	D、UDP协议发送数据
		1、创建发送端Socket对象
			DatagramSocket ds = new DatagramSocket();
		2、创建数据，并把数据打包
			//DatagramPacket(byte[] buf, int offset, int length, InetAddress address, int port) 
			//创建数据
			byte[] by = "hello,你好".getBytes();
			//长度
			int length = by.length;
			//IP地址对象
			InetAddress in = InetAddress.getByName("JXL-ycm");
			//端口
			int port = 10000;
			DatagramPacket p = new DatagramPacket(by, length, in, port);
		3、调用Socket对象的发送方法发送数据包
			//public void send(DatagramPacket p);
			ds.send(p);
		4、释放资源
	E、UDP协议接收数据
		1、创建接收端Socket对象
			DatagramSocket ds = new DatagramSocket(10000);	//调用DatagramSocket(int port)构造方法
		2、创建一个数据包（接收容器）
			byte[] buf = new byte[1024];
			int length = buf.length;
			DatagramPacket dp = new DatagramPacket(buf, length); //用来接收长度为 length 的数据包。
		3、调用Socket对象的接收方法接收数据包
			ds.receive(dp);
		4、解析数据，并显示在控制台
			InetAddress in = dp.getAddress(); //getAddress()，返回接收/发送主机对象
			String ip = in.getHostAddress();
			byte[] by = dp.getData();	//getData(),返回数据缓冲区
			int len = dp.getLength();	//getLength(),返回将要发送或接收到的数据的长度。即实际的数据长度
			String s = new String(by, 0, len);
			System.out.println(ip + "---" + s);
		5、释放资源
			ds.close();

	F、TCP协议发送数据
		1、创建发送端的Socket对象
			Socket so = new Socket("JXL-ycm", 1234);
		2、获取输出流，写数据
			OutputStream out = so.getOutputStream();
			out.write("nihaoTCP".getBytes());
		3、释放资源
			so.close();

	G、TCP协议接收数据
		1、创建接收端的Socket对象
			ServerSocket ss = new ServerSocket(1234);
		2、监听客户端连接，返回一个对应的Socket对象
			Socket s = ss.accept();
		3、获取输入流，读取数据并显示在控制台
			InputStream in = s.getInputStream();
			byte[] by = new byte[1024];
			int len = in.read(by);
			String str = new String(by, 0, len);
			System.out.println(str);
		4、释放资源(关闭客户端对象，而不是关闭服务器对象)
			s.close();






	
	

	

	

