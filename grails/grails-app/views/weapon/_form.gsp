<%@ page import="game.Weapon" %>



<div class="fieldcontain ${hasErrors(bean: weaponInstance, field: 'armourPenetration', 'error')} required">
	<label for="armourPenetration">
		<g:message code="weapon.armourPenetration.label" default="Armour Penetration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="armourPenetration" type="number" max="0" value="${weaponInstance.armourPenetration}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: weaponInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="weapon.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${weaponInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weaponInstance, field: 'damage', 'error')} required">
	<label for="damage">
		<g:message code="weapon.damage.label" default="Damage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="damage" required="" value="${weaponInstance?.damage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: weaponInstance, field: 'requiredSkill', 'error')} required">
	<label for="requiredSkill">
		<g:message code="weapon.requiredSkill.label" default="Required Skill" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requiredSkill" name="requiredSkill.id" from="${game.Skill.list()}" optionKey="id" required="" value="${weaponInstance?.requiredSkill?.id}" class="many-to-one"/>
</div>

