
<%@ page import="game.NonPlayerCharacter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-nonPlayerCharacter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-nonPlayerCharacter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'nonPlayerCharacter.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="armourPoints" title="${message(code: 'nonPlayerCharacter.armourPoints.label', default: 'Armour Points')}" />
					
						<g:sortableColumn property="hp" title="${message(code: 'nonPlayerCharacter.hp.label', default: 'Hp')}" />
					
						<g:sortableColumn property="initialInitative" title="${message(code: 'nonPlayerCharacter.initialInitative.label', default: 'Initial Initative')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nonPlayerCharacterInstanceList}" status="i" var="nonPlayerCharacterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nonPlayerCharacterInstance.id}">${fieldValue(bean: nonPlayerCharacterInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: nonPlayerCharacterInstance, field: "armourPoints")}</td>
					
						<td>${fieldValue(bean: nonPlayerCharacterInstance, field: "hp")}</td>
					
						<td>${fieldValue(bean: nonPlayerCharacterInstance, field: "initialInitative")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nonPlayerCharacterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
