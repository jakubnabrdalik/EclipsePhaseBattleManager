
package game

class Skill {
    String name

    static constraints = {
        name(nullable: false, blank: false)
    }

    @Override
    public String toString() {
        return name
    }
}
