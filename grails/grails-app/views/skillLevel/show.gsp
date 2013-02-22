
<%@ page import="game.SkillLevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'skillLevel.label', default: 'SkillLevel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-skillLevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-skillLevel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list skillLevel">
			
				<g:if test="${skillLevelInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="skillLevel.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${skillLevelInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${skillLevelInstance?.skill}">
				<li class="fieldcontain">
					<span id="skill-label" class="property-label"><g:message code="skillLevel.skill.label" default="Skill" /></span>
					
						<span class="property-value" aria-labelledby="skill-label"><g:link controller="skill" action="show" id="${skillLevelInstance?.skill?.id}">${skillLevelInstance?.skill?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${skillLevelInstance?.id}" />
					<g:link class="edit" action="edit" id="${skillLevelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
