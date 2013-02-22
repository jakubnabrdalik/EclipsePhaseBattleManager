
<%@ page import="game.NonPlayerCharacter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nonPlayerCharacter.label', default: 'NonPlayerCharacter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nonPlayerCharacter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nonPlayerCharacter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nonPlayerCharacter">
			
				<g:if test="${nonPlayerCharacterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="nonPlayerCharacter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${nonPlayerCharacterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nonPlayerCharacterInstance?.armourPoints}">
				<li class="fieldcontain">
					<span id="armourPoints-label" class="property-label"><g:message code="nonPlayerCharacter.armourPoints.label" default="Armour Points" /></span>
					
						<span class="property-value" aria-labelledby="armourPoints-label"><g:fieldValue bean="${nonPlayerCharacterInstance}" field="armourPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nonPlayerCharacterInstance?.hp}">
				<li class="fieldcontain">
					<span id="hp-label" class="property-label"><g:message code="nonPlayerCharacter.hp.label" default="Hp" /></span>
					
						<span class="property-value" aria-labelledby="hp-label"><g:fieldValue bean="${nonPlayerCharacterInstance}" field="hp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nonPlayerCharacterInstance?.initialInitative}">
				<li class="fieldcontain">
					<span id="initialInitative-label" class="property-label"><g:message code="nonPlayerCharacter.initialInitative.label" default="Initial Initative" /></span>
					
						<span class="property-value" aria-labelledby="initialInitative-label"><g:fieldValue bean="${nonPlayerCharacterInstance}" field="initialInitative"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nonPlayerCharacterInstance?.skillLevels}">
				<li class="fieldcontain">
					<span id="skillLevels-label" class="property-label"><g:message code="nonPlayerCharacter.skillLevels.label" default="Skill Levels" /></span>
					
						<g:each in="${nonPlayerCharacterInstance.skillLevels}" var="s">
						<span class="property-value" aria-labelledby="skillLevels-label"><g:link controller="skillLevel" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${nonPlayerCharacterInstance?.weapons}">
				<li class="fieldcontain">
					<span id="weapons-label" class="property-label"><g:message code="nonPlayerCharacter.weapons.label" default="Weapons" /></span>
					
						<g:each in="${nonPlayerCharacterInstance.weapons}" var="w">
						<span class="property-value" aria-labelledby="weapons-label"><g:link controller="weapon" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${nonPlayerCharacterInstance?.id}" />
					<g:link class="edit" action="edit" id="${nonPlayerCharacterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
