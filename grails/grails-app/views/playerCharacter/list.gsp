
<%@ page import="game.PlayerCharacter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'playerCharacter.label', default: 'PlayerCharacter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-playerCharacter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-playerCharacter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'playerCharacter.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="armourPoints" title="${message(code: 'playerCharacter.armourPoints.label', default: 'Armour Points')}" />
					
						<g:sortableColumn property="hp" title="${message(code: 'playerCharacter.hp.label', default: 'Hp')}" />
					
						<g:sortableColumn property="initialInitative" title="${message(code: 'playerCharacter.initialInitative.label', default: 'Initial Initative')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playerCharacterInstanceList}" status="i" var="playerCharacterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${playerCharacterInstance.id}">${fieldValue(bean: playerCharacterInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: playerCharacterInstance, field: "armourPoints")}</td>
					
						<td>${fieldValue(bean: playerCharacterInstance, field: "hp")}</td>
					
						<td>${fieldValue(bean: playerCharacterInstance, field: "initialInitative")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${playerCharacterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
