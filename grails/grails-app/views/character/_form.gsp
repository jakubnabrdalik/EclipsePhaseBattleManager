<%@ page import="game.Character" %>



<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="character.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${characterInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'armourPoints', 'error')} required">
	<label for="armourPoints">
		<g:message code="character.armourPoints.label" default="Armour Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="armourPoints" type="number" value="${characterInstance.armourPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'hp', 'error')} required">
	<label for="hp">
		<g:message code="character.hp.label" default="Hp" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hp" type="number" value="${characterInstance.hp}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'initialInitative', 'error')} required">
	<label for="initialInitative">
		<g:message code="character.initialInitative.label" default="Initial Initative" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="initialInitative" type="number" value="${characterInstance.initialInitative}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'skillLevels', 'error')} ">
	<label for="skillLevels">
		<g:message code="character.skillLevels.label" default="Skill Levels" />
		
	</label>
	<g:select name="skillLevels" from="${game.SkillLevel.list()}" multiple="multiple" optionKey="id" size="5" value="${characterInstance?.skillLevels*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: characterInstance, field: 'weapons', 'error')} ">
	<label for="weapons">
		<g:message code="character.weapons.label" default="Weapons" />
		
	</label>
	<g:select name="weapons" from="${game.Weapon.list()}" multiple="multiple" optionKey="id" size="5" value="${characterInstance?.weapons*.id}" class="many-to-many"/>
</div>

