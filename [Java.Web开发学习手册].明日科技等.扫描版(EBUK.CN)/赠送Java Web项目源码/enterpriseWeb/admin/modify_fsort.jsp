<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.model.Fsort" %>
<%@ page import="com.model.Forum" %>
<%@ page import="com.core.*" %>
<%
if (!Crazyadept.UserIsOK(session,FinalConstants.STATUS_ADMIN)) return;
session.removeAttribute("error");
String action =request.getParameter("action").toString();
int lid=ParamUtils.getIntParameter(request,"fsid");
BasetableFactory bf=BasetableFactory.getInstance();
if(action==null||"".equals(action)){
    return;
}else if("add".equals(action)&&bf.CreateFsort(request)){
        response.sendRedirect("manage_fsort.jsp");
}else if("del".equals(action)){
        Forum forum=bf.SearchForum("WHERE fsid="+lid);
        if(forum!=null&&forum.getFid()>0){
                session.setAttribute("error","不能删除,此类别下有话题存在");
                response.sendRedirect("errorw.jsp");
                return;        }else{
            if(bf.DeleteFsort("WHERE fsid="+lid)){                response.sendRedirect("manage_fsort.jsp");
            }else{
                session.setAttribute("error","删除失败,请稍后重试");
                response.sendRedirect("errorw.jsp");
            }}}else if("modify".equals(action)){
        Fsort f=bf.SearchFsort("WHERE fsid="+lid);
        f.setName(ParamUtils.getRequestString(request,"name"));
        f.setFree(ParamUtils.getIntParameter(request,"free"));
        f.setState(ParamUtils.getIntParameter(request,"state"));
        f.setResume(ParamUtils.getRequestString(request,"resume"));
        response.sendRedirect("manage_fsort.jsp");}else{
        session.setAttribute("error","在论坛版块中操作失败");
        response.sendRedirect("errorw.jsp");
}
%>
