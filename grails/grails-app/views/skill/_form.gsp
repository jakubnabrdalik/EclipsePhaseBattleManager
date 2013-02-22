<%@ page import="game.Skill" %>



<div class="fieldcontain ${hasErrors(bean: skillInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="skill.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${skillInstance?.name}"/>
</div>

