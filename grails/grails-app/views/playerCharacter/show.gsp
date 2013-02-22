
<%@ page import="game.PlayerCharacter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'playerCharacter.label', default: 'PlayerCharacter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-playerCharacter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-playerCharacter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list playerCharacter">
			
				<g:if test="${playerCharacterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="playerCharacter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${playerCharacterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerCharacterInstance?.armourPoints}">
				<li class="fieldcontain">
					<span id="armourPoints-label" class="property-label"><g:message code="playerCharacter.armourPoints.label" default="Armour Points" /></span>
					
						<span class="property-value" aria-labelledby="armourPoints-label"><g:fieldValue bean="${playerCharacterInstance}" field="armourPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerCharacterInstance?.hp}">
				<li class="fieldcontain">
					<span id="hp-label" class="property-label"><g:message code="playerCharacter.hp.label" default="Hp" /></span>
					
						<span class="property-value" aria-labelledby="hp-label"><g:fieldValue bean="${playerCharacterInstance}" field="hp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerCharacterInstance?.initialInitative}">
				<li class="fieldcontain">
					<span id="initialInitative-label" class="property-label"><g:message code="playerCharacter.initialInitative.label" default="Initial Initative" /></span>
					
						<span class="property-value" aria-labelledby="initialInitative-label"><g:fieldValue bean="${playerCharacterInstance}" field="initialInitative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerCharacterInstance?.skillLevels}">
				<li class="fieldcontain">
					<span id="skillLevels-label" class="property-label"><g:message code="playerCharacter.skillLevels.label" default="Skill Levels" /></span>
					
						<g:each in="${playerCharacterInstance.skillLevels}" var="s">
						<span class="property-value" aria-labelledby="skillLevels-label"><g:link controller="skillLevel" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${playerCharacterInstance?.weapons}">
				<li class="fieldcontain">
					<span id="weapons-label" class="property-label"><g:message code="playerCharacter.weapons.label" default="Weapons" /></span>
					
						<g:each in="${playerCharacterInstance.weapons}" var="w">
						<span class="property-value" aria-labelledby="weapons-label"><g:link controller="weapon" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${playerCharacterInstance?.id}" />
					<g:link class="edit" action="edit" id="${playerCharacterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
