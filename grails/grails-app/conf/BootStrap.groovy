import game.*

class BootStrap {

    def init = { servletContext ->
        if (Skill.count() == 0) {

            Skill kineticWeapons = new Skill(name: 'Kinetic weapons').save(failOnError: true)
            Skill beamWeapons = new Skill(name: 'Beam weapons').save(failOnError: true)
            SkillLevel kineticLevel50 = new SkillLevel(skill: kineticWeapons, level: 50).save(failOnError: true)
            SkillLevel kineticLevel30 = new SkillLevel(skill: kineticWeapons, level: 30).save(failOnError: true)
            SkillLevel beamLevel50 = new SkillLevel(skill: beamWeapons, level: 50).save(failOnError: true)
            SkillLevel beamLevel30 = new SkillLevel(skill: beamWeapons, level: 30).save(failOnError: true)
            Weapon smallKineticPistol = new Weapon(name: 'pistol', damage:'10', armourPenetration:0, requiredSkill:kineticWeapons).save(failOnError: true)

            PlayerCharacter zenek = new PlayerCharacter(name: 'Zenek', hp: 50, armourPoints: 3, initialInitative:7, weapons: smallKineticPistol)
            zenek.addToSkillLevels(kineticLevel50)
            zenek.addToSkillLevels(beamLevel30)
            zenek.save(failOnError: true)

            NonPlayerCharacter policeman = new NonPlayerCharacter(name: 'Policeman1', hp: 30, armourPoints: 1, initialInitative:3, weapons: smallKineticPistol)
            policeman.addToSkillLevels(kineticLevel30)
            policeman.addToSkillLevels(beamLevel30)
            policeman.save(failOnError: true)
        }

    }
    def destroy = {
    }
}
