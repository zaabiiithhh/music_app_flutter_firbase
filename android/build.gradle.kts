import org.gradle.api.file.Directory
import org.gradle.api.tasks.Delete
import org.gradle.api.tasks.bundling.DuplicatesStrategy
import org.gradle.api.tasks.bundling.Jar

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// Fix duplicate FlutterPlugin.class in gradle project jar
project(":gradle") {
    tasks.withType<Jar>().configureEach {
        duplicatesStrategy = DuplicatesStrategy.EXCLUDE
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
