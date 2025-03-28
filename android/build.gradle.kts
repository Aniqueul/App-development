allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir) // Use set() instead of value()

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir) // Use set() instead of value()
}

// Removed evaluationDependsOn(":app") unless explicitly needed

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
