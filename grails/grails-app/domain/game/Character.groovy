package game

abstract class Character {
    String name
    int hp
    int armourPoints = 0
    int initialInitative = 0

    static hasMany = [skillLevels:SkillLevel, weapons:Weapon]

    static constraints = {
        name(nullable: false, blank: false)
    }

    static mapping = {
        tablePerHierarchy false
    }

    @Override
    public String toString() {
        return name
    }
}
