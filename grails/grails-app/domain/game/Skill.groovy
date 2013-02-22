
package game

class Skill {
    String name
    int level

    static constraints = {
        name(nullable: false, blank: false)
        level(min: 0, max: 100)
    }
}
