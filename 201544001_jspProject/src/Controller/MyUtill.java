package Controller;

public class MyUtill {

	public int getPageCount(int numPerPage, int dataCount) {
		int totalPage = dataCount/numPerPage;
		
		if(dataCount%numPerPage != 0)
		{
			totalPage++;
		}
		
		return totalPage;
	}
	
	public String pageindexList(int currentPage, int totalPage, String listUrl)
	{
		int numPerBlock =5;
		int currentPageSetup;
		int page;
		
		StringBuffer sb= new StringBuffer();
		if(currentPage == 0 || totalPage ==0)
		{
			return "";
		}
		
		if(listUrl.contains("?"))
		{
			listUrl = listUrl + "&";
		}
		else
		{
			listUrl = listUrl + "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage % numPerBlock == 0)
		{
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		if(totalPage > numPerBlock && currentPage>0)
		{
			sb.append("<li class=\"page-item\"> <a class=\"page-link\" href=\"" + listUrl + "pageNum=" + currentPageSetup + "\" >◀이전</a></li>");
		}
		
		page = currentPageSetup+1;
		
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock))
		{
			if(page == currentPage)
			{
				sb.append("<li class=\"page-item\"> <font class=\"page-link\" color=\"Fuchsia\">"+page+"</font></li>");
			}
			else
			{
				sb.append("<li class=\"page-item\"> <a class=\"page-link\" href=\""+ listUrl + "pageNum="+ page + "\">"+page+"</a></li>");
			}
			page++;
		}
		if(totalPage - currentPageSetup > numPerBlock)
		{
			sb.append("<li class=\"page-item\"> <a class=\"page-link\" href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a></li>");
		}
		return sb.toString();
		
	}
}
