pipeline {
agent any
triggers {
pollSCM('* * * * *')
}
stages {
stage("Checkout") {
steps {
git url: 'https://github.com/Kurogiri-maker/calculator', branch: 'main'
}
}
stage("Compile") {
steps {
sh "./gradlew compileJava"
}
}
stage("Unit test") {
steps {
sh "./gradlew test"
}
}
stage("Package") {
steps {
sh "./gradlew build"
}
}
stage("Initialize"){
steps{
        def dockerHome = tool 'docker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
}
}
stage("Docker build") {
steps {
sh "docker build -t kurogirixo/calculator ."
}
}
stage("Docker push") {
steps {
sh "docker push kurogirixo/calculator"
}
}
}
}
