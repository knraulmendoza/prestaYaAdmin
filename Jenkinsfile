node {

  stage('Checkout') {
    git url: 'https://github.com/knraulmendoza/prestaYaAdmin.git',branch: 'master'
  }
  stage('test') {
    bat 'flutter'
  }
   stage('packages get') {
    bat 'flutter pub get'
  }
  
}
