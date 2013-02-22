
<%@ page import="game.Character" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'character.label', default: 'Character')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-character" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-character" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list character">
			
				<g:if test="${characterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="character.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${characterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${characterInstance?.armourPoints}">
				<li class="fieldcontain">
					<span id="armourPoints-label" class="property-label"><g:message code="character.armourPoints.label" default="Armour Points" /></span>
					
						<span class="property-value" aria-labelledby="armourPoints-label"><g:fieldValue bean="${characterInstance}" field="armourPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${characterInstance?.hp}">
				<li class="fieldcontain">
					<span id="hp-label" class="property-label"><g:message code="character.hp.label" default="Hp" /></span>
					
						<span class="property-value" aria-labelledby="hp-label"><g:fieldValue bean="${characterInstance}" field="hp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${characterInstance?.initialInitative}">
				<li class="fieldcontain">
					<span id="initialInitative-label" class="property-label"><g:message code="character.initialInitative.label" default="Initial Initative" /></span>
					
						<span class="property-value" aria-labelledby="initialInitative-label"><g:fieldValue bean="${characterInstance}" field="initialInitative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${characterInstance?.skillLevels}">
				<li class="fieldcontain">
					<span id="skillLevels-label" class="property-label"><g:message code="character.skillLevels.label" default="Skill Levels" /></span>
					
						<g:each in="${characterInstance.skillLevels}" var="s">
						<span class="property-value" aria-labelledby="skillLevels-label"><g:link controller="skillLevel" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${characterInstance?.weapons}">
				<li class="fieldcontain">
					<span id="weapons-label" class="property-label"><g:message code="character.weapons.label" default="Weapons" /></span>
					
						<g:each in="${characterInstance.weapons}" var="w">
						<span class="property-value" aria-labelledby="weapons-label"><g:link controller="weapon" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${characterInstance?.id}" />
					<g:link class="edit" action="edit" id="${characterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
