package com.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.util.JSONStringer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CreateCodeController {
	// 验证码图片的宽度     
    private int width = 80;         
    // 验证码图片的高度
    private int height = 30;            
    private int codeCount = 4;         
    private int x = 0;            
    private int fontHeight;         
    private int codeY;         
    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',         
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',         
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };         
  
    public void initCode() throws Exception{      
        String strWidth ="90";         
        String strHeight ="20";               
        String strCodeCount = "4";         
       
        try {         
            if (strWidth != null && strWidth.length() != 0) {         
                width = Integer.parseInt(strWidth);         
            }         
            if (strHeight != null && strHeight.length() != 0) {         
                height = Integer.parseInt(strHeight);         
            }         
            if (strCodeCount != null && strCodeCount.length() != 0) {         
                codeCount = Integer.parseInt(strCodeCount);         
            }         
        } catch (NumberFormatException e) {         
        }         
        x = width / (codeCount+1);         
        fontHeight = height - 2;         
        codeY = height - 4;         
    }  
    @RequestMapping(value="createCode",method=RequestMethod.GET)
    public void service(Model model,HttpServletRequest req, HttpServletResponse resp)         
            throws Exception { 
        initCode();        
        BufferedImage buffImg = new BufferedImage(width, height,         
                BufferedImage.TYPE_INT_RGB);         
        Graphics2D g = buffImg.createGraphics();                
        Random random = new Random();         
        // 将图像填充为白色         
        g.setColor(Color.WHITE);         
        g.fillRect(0, 0, width, height);         
        // 创建字体，字体的大小应该根据图片的高度来定。         
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);         
        // 设置字体。         
        g.setFont(font);         
        // 画边框。        
        g.setColor(Color.BLACK);         
        g.drawRect(0, 0, width - 1, height - 1);             
        g.setColor(Color.BLACK);         
        for (int i = 0; i < 10; i++) {         
            int x = random.nextInt(width);         
            int y = random.nextInt(height);         
            int xl = random.nextInt(12);         
            int yl = random.nextInt(12);         
            g.drawLine(x, y, x + xl, y + yl);         
        }              
        StringBuffer randomCode = new StringBuffer();         
        int red = 0, green = 0, blue = 0;         
        // 随机产生codeCount数字的验证码。         
        for (int i = 0; i < codeCount; i++) {         
            // 得到随机产生的验证码数字。         
            String strRand = String.valueOf(codeSequence[random.nextInt(36)]);         
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。         
            red = random.nextInt(255);         
            green = random.nextInt(255);         
            blue = random.nextInt(255);         
            // 用随机产生的颜色将验证码绘制到图像中。         
            g.setColor(new Color(red, green, blue));         
            g.drawString(strRand, (i+1) * x, codeY);         
            // 将产生的四个随机数组合在一起。         
            randomCode.append(strRand);         
        }         
                 
        resp.setHeader("Pragma", "no-cache");         
        resp.setHeader("Cache-Control", "no-cache");         
        resp.setDateHeader("Expires", 0);         
        resp.setContentType("image/jpeg");         
        // 将图像输出到Servlet输出流中。         
        ServletOutputStream sos = resp.getOutputStream();         
        ImageIO.write(buffImg, "jpeg", sos); 
        HttpSession session = req.getSession(); 
        session.setAttribute("code", randomCode.toString());
        sos.close();         
    }       
    
    @RequestMapping(value="getcode",method={RequestMethod.GET,RequestMethod.POST})
	public void getcode(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
    	
		String code = (String)request.getSession().getAttribute("code");
		if(code == null || "".equals(code.trim()))
			code = "1234"; 
		response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = null;
        out = response.getWriter();
        System.out.println(code);
        out.println(code);  
	}
    
}

