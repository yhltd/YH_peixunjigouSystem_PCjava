package com.yhocn.teacher.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import Bean.SessionUtil;
import com.google.gson.Gson;
import com.yhocn.keshi_detail.entity.Keshidetail;
import com.yhocn.keshi_detail.service.KeshiDetailService;
import com.yhocn.student.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yhocn.teacher.entity.Teacher;
import com.yhocn.teacher.service.TeacherService;
import com.yhocn.login.controller.LoginController;

@Controller
@RequestMapping("/tea")
public class TeacherController {


	@Autowired
	private TeacherService service;
	@Autowired
	private KeshiDetailService service2;

	@RequestMapping("/teacher")
	public ModelAndView query(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getSel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}

		c=e.a;
		List<Teacher> telist = service.selectAll(t,c);
		mv.addObject("telist",telist);
		mv.setViewName("/tea/teacher.jsp");
		return mv;
	}
	@RequestMapping("/teacher1")
	public ModelAndView query1(ModelAndView mv,Teacher t, String c, String a, String b, String d, HttpServletRequest request) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getSel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		a=request.getParameter("realName").trim();
		b=request.getParameter("teacher").trim();
		d=request.getParameter("peixun").trim();
		List<Teacher> telist = service.selectAll1(t,c,a,b,d);
		mv.addObject("telist",telist);
		mv.setViewName("/tea/teacher.jsp");
		return mv;
	}

	@RequestMapping("/toalter")
	public ModelAndView toalter(ModelAndView mv,Teacher t, String c) {
		LoginController e=new  LoginController();
		c=e.a;
		Teacher t2 = service.selectById(t,c);
		mv.addObject("teacher",t2);
		mv.setViewName("/tea/alter.jsp");
		return mv;
	}
	@RequestMapping("/alter")
	public ModelAndView alter(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getUpd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}

		c=e.a;
		int i = service.alter(t,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/tea/teacher.action");
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/tea/alter.jsp");
		}
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(ModelAndView mv,Teacher t,HttpSession se, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getUpd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		int i = service.update(t,c);
		if(i>0) {
			mv.addObject("msg","修改用户成功");
			mv.setViewName("/tea/update.jsp");
			se.setAttribute("GLOBAL_USER", t);
		}else {
			mv.addObject("msg","修改用户失败");
			mv.setViewName("/tea/update.jsp");
		}
		return mv;
	}
	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView mv,Teacher t, String c) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getDel().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		int i = service.delete(t,c);
		if(i>0) {
			mv.addObject("msg","删除用户成功");
		}else {
			mv.addObject("msg","删除用户失败");
		}
		mv.setViewName("/tea/teacher.action");
		return mv;
	}
	@RequestMapping(value = "/add",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public ModelAndView add(ModelAndView mv,Teacher t, String c,HttpSession session) {
		LoginController e = new LoginController();
		boolean pd=false;
		for (int i=0;i<e.quanxian.size();i++){
			if(e.quanxian.get(i).getView_name().equals("用户管理")&&e.quanxian.get(i).getAdd().equals("√")){
				pd=true;
			}
		}
		if(!pd){
			mv.addObject("msg", "无权限");
			mv.setViewName("/main.jsp");
			return mv;
		}
		c=e.a;
		boolean panduan = true;
		String userNum = SessionUtil.getUserNum(session);
		if(userNum != ""){
			int num = Integer.parseInt(userNum);
			List<Teacher> teacherList = service.selectAll(t,c);
			if(teacherList.size() >= num){
				mv.addObject("msg","已有账号数量过多，请删除无用账号后再试");
				mv.setViewName("/tea/add.jsp");
				panduan = false;
			}
		}
		if(panduan){
			int i = service.add(t,c);
			if(i>0) {
				mv.addObject("msg","增加用户成功");
				mv.setViewName("/tea/teacher.action");
			}else {
				mv.addObject("msg","增加用户失败");
				mv.setViewName("/tea/add.jsp");
			}
		}
		return mv;
	}
//	@RequestMapping("/jisuan")
//	public ModelAndView info1(ModelAndView mv, Keshidetail ksd, String a , String c, HttpServletRequest request) {
//		a=request.getParameter("date2");
//		String b=request.getParameter("teacher_name");
////        String strDateFormat = "yyyy-MM";
////        SimpleDateFormat sdf = new SimpleDateFormat(a);
//		if (!a.equals("")){
//			String s1[]=a.split("-");
//			a=s1[0]+ "-" + s1[1];}
//		LoginController e=new  LoginController();
//		c=e.a;
//		List<Keshidetail> list = service2.select1(ksd,c,a,b);
//		mv.addObject("teacherKeshiList",list);
//		mv.setViewName("/tea/jisuan.jsp");
//		return mv;
//	}
@RequestMapping("/jisuan")
public ModelAndView info1(ModelAndView mv, HttpServletRequest request) {
	try {
		// 1. 获取参数，处理null
		String a = request.getParameter("date2");
		String b = request.getParameter("teacher_name");

		if (a == null) a = "";
		if (b == null) b = "";

		// 2. 日期格式化
		if (!a.isEmpty()) {
			String[] s1 = a.split("-");
			if (s1.length >= 2) {
				a = s1[0] + "-" + s1[1];
			}
		}

		// 3. 获取公司代码 - 安全方式
		String c = "default_company";
		try {
			LoginController e = new LoginController();
			if (e != null && e.a != null && !e.a.trim().isEmpty()) {
				c = e.a.trim();
			}
		} catch (Exception e) {
			System.err.println("获取公司代码失败: " + e.getMessage());
		}

		// 4. 创建查询对象
		Keshidetail ksd = new Keshidetail();

		// 5. 检查service2是否注入
		if (service2 == null) {
			System.err.println("ERROR: service2 is null! Check @Autowired annotation.");
			// 返回空列表
			mv.addObject("teacherKeshiList", new ArrayList<>());
			mv.addObject("msg", "系统服务未就绪");
			mv.setViewName("/tea/jisuan.jsp");
			return mv;
		}

		// 6. 执行查询
		List<Keshidetail> list = null;
		try {
			list = service2.select1(ksd, c, a, b);
		} catch (Exception e) {
			System.err.println("数据库查询异常: " + e.getMessage());
			list = new ArrayList<>();
		}

		// 7. 确保list不为null
		if (list == null) {
			list = new ArrayList<>();
		}

		// 8. 返回结果
		mv.addObject("teacherKeshiList", list);
		mv.setViewName("/tea/jisuan.jsp");

	} catch (Exception e) {
		e.printStackTrace();
		System.err.println("Controller异常: " + e.getMessage());
		// 发生异常时返回空页面
		mv.addObject("teacherKeshiList", new ArrayList<>());
		mv.addObject("msg", "系统异常: " + e.getMessage());
		mv.setViewName("/tea/jisuan.jsp");
	}

	return mv;
}
	@RequestMapping(value = "/jiamiGet",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String jiamiGet(@RequestParam(value="text") String text) throws Exception {
		//秘钥(需要使用长度为16、24或32的字节数组作为AES算法的密钥，否则就会遇到java.security.InvalidKeyException异常)
		String key="20230915IsMaimes";
		//加密，生成密文
		String base64Encrypted = AESEncryptDemo(text,key);
		return base64Encrypted;
	}

	@RequestMapping(value = "/jiemiGet",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String jiemiGet(@RequestParam(value="text") String text) throws Exception {
		String key="20230915IsMaimes";
		//解密，获取明文
		String text2 = AESDecryptDemo(text,key);
		return text2;
	}


	/**
	 * AES算法加密
	 * @Param:text原文
	 * @Param:key密钥
	 * */
	public String AESEncryptDemo(String text,String key) throws Exception {
		// 创建AES加密算法实例(根据传入指定的秘钥进行加密)
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");

		// 初始化为加密模式，并将密钥注入到算法中
		cipher.init(Cipher.ENCRYPT_MODE, keySpec);

		// 将传入的文本加密
		byte[] encrypted = cipher.doFinal(text.getBytes());

		//生成密文
		// 将密文进行Base64编码，方便传输
		return Base64.getEncoder().encodeToString(encrypted);
	}

	/**
	 * AES算法解密
	 * @Param:base64Encrypted密文
	 * @Param:key密钥
	 * */
	public String AESDecryptDemo(String base64Encrypted,String key)throws Exception{
		// 创建AES解密算法实例
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");

		// 初始化为解密模式，并将密钥注入到算法中
		cipher.init(Cipher.DECRYPT_MODE, keySpec);

		// 将Base64编码的密文解码
		byte[] encrypted = Base64.getDecoder().decode(base64Encrypted);

		// 解密
		byte[] decrypted = cipher.doFinal(encrypted);
		return new String(decrypted);
	}
}
