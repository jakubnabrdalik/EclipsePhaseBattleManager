<%@ page import="game.NonPlayerCharacter" %>



<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="nonPlayerCharacter.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${nonPlayerCharacterInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'armourPoints', 'error')} required">
	<label for="armourPoints">
		<g:message code="nonPlayerCharacter.armourPoints.label" default="Armour Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="armourPoints" type="number" value="${nonPlayerCharacterInstance.armourPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'hp', 'error')} required">
	<label for="hp">
		<g:message code="nonPlayerCharacter.hp.label" default="Hp" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hp" type="number" value="${nonPlayerCharacterInstance.hp}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'initialInitative', 'error')} required">
	<label for="initialInitative">
		<g:message code="nonPlayerCharacter.initialInitative.label" default="Initial Initative" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="initialInitative" type="number" value="${nonPlayerCharacterInstance.initialInitative}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'skillLevels', 'error')} ">
	<label for="skillLevels">
		<g:message code="nonPlayerCharacter.skillLevels.label" default="Skill Levels" />
		
	</label>
	<g:select name="skillLevels" from="${game.SkillLevel.list()}" multiple="multiple" optionKey="id" size="5" value="${nonPlayerCharacterInstance?.skillLevels*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nonPlayerCharacterInstance, field: 'weapons', 'error')} ">
	<label for="weapons">
		<g:message code="nonPlayerCharacter.weapons.label" default="Weapons" />
		
	</label>
	<g:select name="weapons" from="${game.Weapon.list()}" multiple="multiple" optionKey="id" size="5" value="${nonPlayerCharacterInstance?.weapons*.id}" class="many-to-many"/>
</div>

