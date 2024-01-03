


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestProject
 */
@WebServlet("/TestProject")
public class TestProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Keyword> keywords = new ArrayList<Keyword>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		if (request.getParameter("Brand") == null) {
			String requestUri = request.getRequestURI();
			request.setAttribute("requestUri", requestUri);
			request.getRequestDispatcher("Search.jsp").forward(request, response);
			return;
		}
		if (request.getParameter("keyword") == null) {
			String requestUri = request.getRequestURI();
			request.setAttribute("requestUri", requestUri);
			request.getRequestDispatcher("Search.jsp").forward(request, response);
			return;
		}
		GoogleQuery google = new GoogleQuery(request.getParameter("Brand")+"mouse");
		HashMap<String, String> query = google.query();
		String keyword = request.getParameter("keyword");
		String[] input_keywords = keyword.split(" ");
		int p = 1, q = 2;
		int numOfKeywords = Integer.parseInt(input_keywords[0]);
		for (int i = 0; i < numOfKeywords; i++) {
			String name = input_keywords[p];
			p += 2;
			double weight = Double.parseDouble(input_keywords[q]);
			q += 2;
			Keyword k = new Keyword(name, weight);
			keywords.add(k);
		}
		int count = 0;
		for (String key : query.keySet()) {
			long time1 = 0;
			time1 = System.currentTimeMillis();
			WebPage rootPage = new WebPage(query.get(key), key.toString());
			WebTree tree = new WebTree(rootPage);
			Read_Sub_Links read_sulink = new Read_Sub_Links(query.get(key));
			for (String url : read_sulink.uniqueURL) {
				tree.root.addChild(new WebNode(new WebPage(url, key.toString())));
			}
			tree.setPostOrderScore(keywords);
			tree.eularPrintTree();
			request.setAttribute("unsort_map", tree.map);
			HashMap sort_map=tree.sortValues(tree.map);
			request.setAttribute("sort_map", sort_map);
			read_sulink.uniqueURL.clear();
			long time2 = 0;
			time2 = System.currentTimeMillis();
			System.out.println("doSomething()花了：" + (time2 - time1) / 1000 + "秒");
			count++;
			if (count == 5) {
				break;
			}
		}
		request.getRequestDispatcher("googleitem.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}