<%@ page import="game.PlayerCharacter" %>



<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="playerCharacter.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${playerCharacterInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'armourPoints', 'error')} required">
	<label for="armourPoints">
		<g:message code="playerCharacter.armourPoints.label" default="Armour Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="armourPoints" type="number" value="${playerCharacterInstance.armourPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'hp', 'error')} required">
	<label for="hp">
		<g:message code="playerCharacter.hp.label" default="Hp" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hp" type="number" value="${playerCharacterInstance.hp}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'initialInitative', 'error')} required">
	<label for="initialInitative">
		<g:message code="playerCharacter.initialInitative.label" default="Initial Initative" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="initialInitative" type="number" value="${playerCharacterInstance.initialInitative}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'skillLevels', 'error')} ">
	<label for="skillLevels">
		<g:message code="playerCharacter.skillLevels.label" default="Skill Levels" />
		
	</label>
	<g:select name="skillLevels" from="${game.SkillLevel.list()}" multiple="multiple" optionKey="id" size="5" value="${playerCharacterInstance?.skillLevels*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerCharacterInstance, field: 'weapons', 'error')} ">
	<label for="weapons">
		<g:message code="playerCharacter.weapons.label" default="Weapons" />
		
	</label>
	<g:select name="weapons" from="${game.Weapon.list()}" multiple="multiple" optionKey="id" size="5" value="${playerCharacterInstance?.weapons*.id}" class="many-to-many"/>
</div>

