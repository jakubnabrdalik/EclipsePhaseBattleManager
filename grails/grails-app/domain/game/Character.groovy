package game

class Character {
    String name
    int hp
    List<Skill> skills
    List<Weapon> weapons
    int armourPoints = 0
    int initialInitative = 0

    static constraints = {
        name(nullable: false, blank: false)
    }
}
