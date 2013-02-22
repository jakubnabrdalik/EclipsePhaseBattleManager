
<%@ page import="game.Weapon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'weapon.label', default: 'Weapon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-weapon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-weapon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list weapon">
			
				<g:if test="${weaponInstance?.armourPenetration}">
				<li class="fieldcontain">
					<span id="armourPenetration-label" class="property-label"><g:message code="weapon.armourPenetration.label" default="Armour Penetration" /></span>
					
						<span class="property-value" aria-labelledby="armourPenetration-label"><g:fieldValue bean="${weaponInstance}" field="armourPenetration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weaponInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="weapon.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${weaponInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weaponInstance?.damage}">
				<li class="fieldcontain">
					<span id="damage-label" class="property-label"><g:message code="weapon.damage.label" default="Damage" /></span>
					
						<span class="property-value" aria-labelledby="damage-label"><g:fieldValue bean="${weaponInstance}" field="damage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${weaponInstance?.requiredSkill}">
				<li class="fieldcontain">
					<span id="requiredSkill-label" class="property-label"><g:message code="weapon.requiredSkill.label" default="Required Skill" /></span>
					
						<span class="property-value" aria-labelledby="requiredSkill-label"><g:link controller="skill" action="show" id="${weaponInstance?.requiredSkill?.id}">${weaponInstance?.requiredSkill?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${weaponInstance?.id}" />
					<g:link class="edit" action="edit" id="${weaponInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
