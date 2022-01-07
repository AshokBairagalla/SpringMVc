<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Movie List</title>
        <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
        <link rel="icon" type="image/png" href="<c:url value="/res/favicon.png"/>"/>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#checkBoxAll').click(function () {
                    if ($(this).is(":checked"))
                        $('.chkCheckBoxId').prop('checked', true);
                    else
                        $('.chkCheckBoxId').prop('checked', false);
                });
            });
        </script>
    </head>
    <body >
        <form action="<c:url value="deleteByCheck"/>">
            <div id="SLIDE_BG">
                <table class="style">
                    <caption class="heading">Films</caption>
                    <c:if test="${filmsCount > 0}">

                        <tr>
                            <th ><input type="checkbox" id="checkBoxAll" /></th>
                            <th style="width: 100%">title</th>
                            <th>year</th>
                            <th>genre</th>
                            <th>watched</th>
                        </tr>

                        <c:forEach var="film" items="${filmsList}" varStatus="i">
                            <tr>
                                <!--<td class="left-side">${i.index + 1 + (page - 1) * 10}</td>-->
                                <td><input type="checkbox" class="chkCheckBoxId" value="${film.id}" name="fid" /></td>
                                <td class="title"><a href="${pageContext.request.contextPath}/edit/${film.id}"/>${film.title}</td>
                                <td><a href="${pageContext.request.contextPath}/edit/${film.id}"/>${film.year}</td>
                                <td><a href="${pageContext.request.contextPath}/edit/${film.id}"/>${film.genre}</td>
                                <td>
                                    <c:if test="${film.watched == true}">
                                        <span class="icon icon-watched"></span>
                                    </c:if>
                                </td>
                               

                            </tr>
                        </c:forEach>


                    </c:if>
                    <td colspan="7" class="left-side link right-side">
                        <a style="margin-right: 70px; font-size: 100%" href="<c:url value="/add"/>">
                            <span class="icon icon-add"></span>Add new film
                        </a><br><br>
                    <center><input type="submit" value="Delete" class="btn btn-outline-warning"/></center>

                    <c:if test="${filmsCount == 0}">
                        <tr>
                            <td colspan="7" style="font-size: 150%" class="left-side right-side">
                                the list is empty but you can add a new film
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td colspan="7" class="left-side link right-side">

                            <c:if test="${pagesCount > 1}">
                                <c:set value="disabled" var="disabled"/>
                                <c:set value="" var="active"/>
                                <c:url value="/list/" var="url">
                                    <c:param name="page" value="1"/>
                                </c:url>
                                <a class="${page == 1 ? disabled : active}" href="${url}">
                                    &nbsp<span class="icon icon-first"></span>&nbsp
                                </a>
                                <c:url value="/list/" var="url">
                                    <c:param name="page" value="${page - 1}"/>
                                </c:url>
                                <a class="${page == 1 ? disabled : active}" href="${url}">
                                    &nbsp<span class="icon icon-prev"></span>&nbsp
                                </a>

                                <c:if test="${pagesCount <= 5}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${pagesCount}"/>
                                </c:if>
                                <c:if test="${pagesCount > 5}">
                                    <c:choose>
                                        <c:when test="${page < 3}">
                                            <c:set var="begin" value="1"/>
                                            <c:set var="end" value="5"/>
                                        </c:when>
                                        <c:when test="${page > pagesCount - 2}">
                                            <c:set var="begin" value="${pagesCount - 4}"/>
                                            <c:set var="end" value="${pagesCount}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="begin" value="${page - 2}"/>
                                            <c:set var="end" value="${page + 2}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:forEach begin="${begin}" end="${end}" step="1" varStatus="i">
                                    <c:url value="/list/" var="url">
                                        <c:param name="page" value="${i.index}"/>
                                    </c:url>
                                    <c:set value="current-page" var="current"/>
                                    <c:set value="" var="perspective"/>
                                    <a class="${page == i.index ? current : perspective}" href="${url}">${i.index}</a>
                                </c:forEach>

                                <c:url value="/list/" var="url">
                                    <c:param name="page" value="${page + 1}"/>
                                </c:url>
                                <a class="${page == pagesCount ? disabled : active}" href="${url}">
                                    &nbsp<span class="icon icon-next"></span>&nbsp
                                </a>
                                <c:url value="/list/" var="url">
                                    <c:param name="page" value="${pagesCount}"/>
                                </c:url>
                                <a class="${page == pagesCount ? disabled : active}" href="${url}">
                                    &nbsp<span class="icon icon-last"></span>&nbsp
                                </a>
                                <br><br>

                                <a style="align-content: center; font-size: 100%; padding-left: 10px; " href="<c:url value="/logout"/>" class="btn btn-outline-warning">Logout</a>
                            </c:if>
                            <br>
                            <span style="margin-left: 70px; font-size: 120%">Total number Of films: ${filmsCount}</span>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>


