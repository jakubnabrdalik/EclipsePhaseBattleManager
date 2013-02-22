
<%@ page import="game.Weapon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'weapon.label', default: 'Weapon')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-weapon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-weapon" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="armourPenetration" title="${message(code: 'weapon.armourPenetration.label', default: 'Armour Penetration')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'weapon.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="damage" title="${message(code: 'weapon.damage.label', default: 'Damage')}" />
					
						<th><g:message code="weapon.requiredSkill.label" default="Required Skill" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${weaponInstanceList}" status="i" var="weaponInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${weaponInstance.id}">${fieldValue(bean: weaponInstance, field: "armourPenetration")}</g:link></td>
					
						<td>${fieldValue(bean: weaponInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: weaponInstance, field: "damage")}</td>
					
						<td>${fieldValue(bean: weaponInstance, field: "requiredSkill")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${weaponInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
