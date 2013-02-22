package game

class Weapon {
    Skill requiredSkill
    String name
    String damage
    int armourPenetration

    static constraints = {
        armourPenetration(max:0)
        name(nullable: false, blank: false)
        damage(nullable: false, blank: false)
    }

    @Override
    public String toString() {
        return name
    }
}
