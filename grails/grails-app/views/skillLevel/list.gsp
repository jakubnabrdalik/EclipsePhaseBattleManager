
<%@ page import="game.SkillLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'skillLevel.label', default: 'SkillLevel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-skillLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-skillLevel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="level" title="${message(code: 'skillLevel.level.label', default: 'Level')}" />
					
						<th><g:message code="skillLevel.skill.label" default="Skill" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${skillLevelInstanceList}" status="i" var="skillLevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${skillLevelInstance.id}">${fieldValue(bean: skillLevelInstance, field: "level")}</g:link></td>
					
						<td>${fieldValue(bean: skillLevelInstance, field: "skill")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${skillLevelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
