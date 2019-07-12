package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.onedao;
import entity.Adm;
import entity.Car;
import entity.Shop;

public class one extends HttpServlet {

	ArrayList<Car> myal=new ArrayList<Car>();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("myal")==null){
			request.getSession().setAttribute("myal", myal);
		}
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		String flag=request.getParameter("flag");
		if("login".equals(flag)){
			Adm adm=new Adm();
			adm.setAdminID(request.getParameter("AdminID"));
			adm.setPassword(request.getParameter("Password"));
			boolean bl=new onedao().login(adm);
			if(bl){
				request.getSession().setAttribute("AdminID", adm.getAdminID());
				request.getRequestDispatcher("loginsuccess.jsp").forward(request, response);
			}else{
				request.getSession().setAttribute("new", "登录失败");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else if("selectshop".equals(flag)){
			ArrayList<Shop> al=new onedao().selectshop();
			request.setAttribute("al", al);
			request.getRequestDispatcher("selectshop.jsp").forward(request, response);
		}else if("myshopcar".equals(flag)){
			String[] shops=request.getParameterValues("myshop");
			ArrayList<String> al=new ArrayList<String>();
			if(shops!=null){
				for(String str:shops){
					al.add(str);
				}
			}
			request.setAttribute("al", al);
			request.getRequestDispatcher("myshopcar.jsp").forward(request, response);
		}else if("addshop".equals(flag)){
			ArrayList<Car> al=(ArrayList<Car>)request.getSession().getAttribute("myal");
			String[] shops=request.getParameterValues("myshop");
			onedao od=new onedao();
			if(shops!=null){
				for(int a=0;a<shops.length;a++){
					for(int b=0;b<al.size()||al.size()==0;b++){
						if(al.size()!=0&&Integer.parseInt(shops[a])==al.get(b).getC_s_id()){
							al.get(b).setC_num(al.get(b).getC_num()+1);
							break;
						}else if(al.size()==0||b==al.size()-1){
							Car car=new Car();
							Shop shop=od.selectshopbyid(Integer.parseInt(shops[a]));
							car.setC_a_id((String)request.getSession().getAttribute("AdminID"));
							car.setC_id(al.size()+1);
							car.setC_name(shop.getS_name());
							car.setC_num(1);
							car.setC_price(shop.getS_price());
							car.setC_s_id(shop.getS_id());
							car.setC_type(shop.getS_type());
							car.setC_weight(shop.getS_weight());
							al.add(car);
							break;
						}
					}
				}
				
			}
			request.getRequestDispatcher("myshopcar.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
