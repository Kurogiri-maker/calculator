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
stage("Deploy to staging") {
steps {
sh "docker run -d --rm -p 8765:8765 --name calculator kurogirixo/calculator"
}
}
stage("Acceptance test") {
steps {
sleep 60
sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
}
}
}
}
