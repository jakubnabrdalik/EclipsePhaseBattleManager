package game

import groovy.transform.ToString

@ToString
class SkillLevel {
    Skill skill
    int level

    static constraints = {
        level(min: 0, max: 100)
    }
}
