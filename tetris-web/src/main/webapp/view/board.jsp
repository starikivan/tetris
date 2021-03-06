<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Glass board</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jcanvas.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
    <script>
        $(document).ready(function () {
            var players = new Object();
            <c:forEach items="${players}" var="player">
            players["${player.name}"] = "${player.name}";
            </c:forEach>
            initBoard(players, ${allPlayersScreen}, '${pageContext.request.contextPath}/');
        });
    </script>

    <script src="${pageContext.request.contextPath}/resources/js/leaderstable.js"></script>
    <script>
        $(document).ready(function(){
            initLeadersTable('${pageContext.request.contextPath}/');
        });
    </script>

    <link href="${pageContext.request.contextPath}/resources/css/tetris.css" rel="stylesheet">
</head>
<body>
    <span class="score-info width-calculator" id="width_calculator_container"></span>

    <div id="showdata"></div>
    <div>
        <div id="glasses">
            <c:forEach items="${players}" var="player">
                <div id="div_${player.name}" style="float: left">
                    <table>
                        <tr>
                            <td>
                                <span class="label label-info big">${player.name}</span> :
                                <span class="label label-info big" id="score_${player.name}"></span>
                            </td>
                        </tr>
                        <c:if test="${!allPlayersScreen}">
                            <tr>
                                <td>
                                    <span class="label small">Level</span> :
                                    <span class="label small" id="level_${player.name}"></span>
                                    <span class="label small">Lines removed</span> :
                                    <span class="label small" id="lines_removed_${player.name}"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="label small">For next level</span> :
                                    <span class="label small" id="next_level_${player.name}"></span>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <canvas id="${player.name}" width="240" height="480" style="border:1px solid">
                                    <!-- each pixel is 24x24-->
                                    Your browser does not support the canvas element.
                                </canvas>

                                <span class="score-info" id="score_info_${player.name}">+200</span>
                            </td>
                        </tr>
                    </table>
                </div>
            </c:forEach>

            <div id="systemCanvas" style="display: none">
                <canvas id="_system" width="168" height="24"> <!-- 7 figures x 24px-->
                    Your browser does not support the canvas element.
                </canvas>
                <img src="${pageContext.request.contextPath}/resources/blue.png" id="blue">
                <img src="${pageContext.request.contextPath}/resources/cyan.png" id="cyan">
                <img src="${pageContext.request.contextPath}/resources/green.png" id="green">
                <img src="${pageContext.request.contextPath}/resources/orange.png" id="orange">
                <img src="${pageContext.request.contextPath}/resources/purple.png" id="purple">
                <img src="${pageContext.request.contextPath}/resources/red.png" id="red">
                <img src="${pageContext.request.contextPath}/resources/yellow.png" id="yellow">
            </div>
        </div>
        <div id="leaderboard">
            <%@include file="leaderstable.jsp"%>
        </div>
    </div>
</body>
</html>