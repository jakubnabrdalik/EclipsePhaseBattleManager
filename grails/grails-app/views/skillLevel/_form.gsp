<%@ page import="game.SkillLevel" %>



<div class="fieldcontain ${hasErrors(bean: skillLevelInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="skillLevel.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" min="0" max="100" value="${skillLevelInstance.level}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: skillLevelInstance, field: 'skill', 'error')} required">
	<label for="skill">
		<g:message code="skillLevel.skill.label" default="Skill" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="skill" name="skill.id" from="${game.Skill.list()}" optionKey="id" required="" value="${skillLevelInstance?.skill?.id}" class="many-to-one"/>
</div>

